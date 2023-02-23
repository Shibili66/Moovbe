import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Login.dart';


class intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF002352),
        body: Padding(
          padding: const EdgeInsets.only(left:8,top:170),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 180,),
                child: SizedBox(height: 25,width: 25,
                    child: Image(image: AssetImage("assets/image/ima.png"),color: Colors.yellow,)),
              ),
              Padding(
                padding: const EdgeInsets.only(left:50),
                child: Row(
                  children: [
                    Text("moov",style:GoogleFonts.lilitaOne(textStyle: TextStyle(color:Colors.white,fontWeight: FontWeight.w400),fontSize: 78,),),
                    Text("be",style:GoogleFonts.lilitaOne(textStyle: TextStyle(color:Colors.yellow,fontWeight: FontWeight.w400),fontSize: 78,),),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white,),
                      minimumSize: MaterialStateProperty.all(Size(310, 55)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                      )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                  }, child: Text("Get Started",style: TextStyle(color: Colors.black),)),
            ],
          ),
        ),
      ),
    );
  }

}