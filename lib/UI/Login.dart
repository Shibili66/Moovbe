import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var UserController = TextEditingController();
  var passController = TextEditingController();
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async{
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true
            );
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .width * 0.70,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/ooo.png",),
                    fit: BoxFit.cover,
                  )
              ),
              child: Stack(
                  children: [ Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 120,
                      ),
                      Text("Welcome", style: TextStyle(fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),),
                      Padding(
                        padding: EdgeInsets.only(left: 25, top: 5),
                        child: Text("Manage your Bus and Drivers",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17),),
                      )
                    ],
                  ),
                  ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: UserController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.person_outline),
                    label:  const Center(child: Text('Enter UserName')),
                    labelStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.grey.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:30,right: 30),
              child:TextField(
                controller: passController,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.lock),
                    label:  Center(child: Text('Enter Password')),
                    labelStyle: TextStyle(color: Colors.black54),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.grey.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 0, style: BorderStyle.none),
                    )
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF002352),),
                    minimumSize: MaterialStateProperty.all(Size(280, 55)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )
                    )
                ),
                onPressed: () {
                  login();
                }, child: Text("Login", style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),

    );
  }

  Future<void> login() async {
    if (passController.text.isNotEmpty && UserController.text.isNotEmpty) {
      var response =
      await http.post(Uri.parse("http://flutter.noviindus.co.in/api/LoginApi"),
          body: ({'username':UserController.text,
            'password' :passController.text,
          })
      );
      if(response.statusCode==200){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid cradilas"),));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Black field Not Availablel")));
    }
  }
  void showDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text("No Connection"),
        content: Text("Please check your internet Connectivity"),
        actions: <Widget>[
          TextButton(onPressed: () async {
            Navigator.pop(context, 'cancel');
            setState(() => isAlertSet = false);
            isDeviceConnected =
            await InternetConnectionChecker().hasConnection;
            if (! isDeviceConnected){
              showDialogBox();
              setState(() => isAlertSet = true);
            }
          },
            child: Text('OK'),)
        ],
      )
  );

}
