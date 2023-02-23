import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Provider.dart';
import 'package:provider/provider.dart';

import 'Bus_Manage.dart';

class home extends StatefulWidget{
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BusProvider>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left:20,top: 17),
          child: Row(
            children: [
              Text("moov",style:GoogleFonts.lilitaOne(textStyle: TextStyle(color:Colors.white,fontWeight: FontWeight.w300),fontSize: 55,),),
              Text("be",style:GoogleFonts.lilitaOne(textStyle: TextStyle(color:Colors.yellow,fontWeight: FontWeight.bold),fontSize: 55,),),
            ],
          ),
        ),
        backgroundColor: Colors.black87,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: SizedBox(
            height: 50,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:7),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: MediaQuery.of(context).size.height * 0.28,
                      decoration: BoxDecoration(
                        color: Color(0xFF002352),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Column(
                        children: [
                              Padding(
                                padding: const EdgeInsets.only(right:48),
                                child: Text("Bus",style: TextStyle(fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 36),),
                              ),
                          Text("Manage your Bus",style: TextStyle(fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 15),),
                          Padding(
                            padding: const EdgeInsets.only(left:41),
                            child: SizedBox(
                                height: 107,
                                width: 118,
                                child: Image(image: AssetImage("assets/image/bussss.png"))),
                          )
                        ],
                      ),
                    ),
                  ),
              Padding(
                padding:  EdgeInsets.all(10),
                child: InkWell(
                  onTap: ()async {
                    await provider.login(username.text, password.text).then((value) => provider.driversGet().then((value) => Navigator.pushReplacementNamed(context, '/drivers')));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: MediaQuery.of(context).size.height * 0.28,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(13)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right:33),
                          child: Text("Driver",style: TextStyle(fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 33),),
                        ),
                        Text("Manage your Driver",style: TextStyle(fontWeight: FontWeight.w300,
                            color: Colors.white,
                            fontSize: 14),),
                        Padding(
                          padding: const EdgeInsets.only(left:20),
                          child: SizedBox(
                              height: 110,
                              width: 122,
                              child: Image(image: AssetImage("assets/image/captain .png"))),
                        )
                      ],
                    ),
                  ),
                ),
              ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:8,right:210),
                child: Text("25 Buses Found",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 16),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardOption(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardOption(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardOption(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardOption(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardOption(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardOption(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardOption(),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Container CardOption() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.22,
                height: MediaQuery.of(context).size.height * 0.14,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomLeft: Radius.circular(15))
                ),
                child: Image(image: AssetImage("assets/image/ksrtcbus.png")),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:14,bottom:25),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:83,top:21),
                  child: Text("KSRTC",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                ),
                Text("Swift Scania P-series",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20,left: 13),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF002352),),
                    minimumSize: MaterialStateProperty.all(Size(65,30)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                    )
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Manage()));
                },
                child: Text("Manage",style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
    );
  }

}

