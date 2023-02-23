import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddDriver extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:AppBar(
       leading: InkWell(
           onTap: (){
             Navigator.pop(context);
           },
           child: Padding(
             padding: const EdgeInsets.only(top: 20),
             child: Icon(Icons.arrow_back,color:Colors.white),
           )),
       centerTitle: true,
       title: Padding(
         padding: const EdgeInsets.only(right:40,top: 30),
         child: Center(child: Text("Add Driver",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400,fontSize: 22),)),
       ),
       backgroundColor: Colors.black87,
       bottom: PreferredSize(
         preferredSize: Size.fromHeight(30),
         child: SizedBox(
           height: 30,
         ),
       ),
     ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Padding(
           padding: const EdgeInsets.all(30),
           child: TextField(
             cursorColor: Colors.black,
             style: TextStyle(color: Colors.black),
             decoration: InputDecoration(
                 label:  Center(child: Text('Enter Name')),
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
         Padding(
           padding: const EdgeInsets.only(left:30,right: 30),
           child: TextField(
             cursorColor: Colors.black,
             style: TextStyle(color: Colors.black),
             decoration: InputDecoration(
                 label:  Center(child: Text('Enter License Numeber')),
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
       ],
     ),
       bottomNavigationBar:Padding(
         padding: const EdgeInsets.all(25),
         child: ElevatedButton(
           style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(Color(0xFF002352),),
               minimumSize: MaterialStateProperty.all(Size(100, 55)),
               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                   RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0),

                   )
               )
           ),
           onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=> AddDriver())); },
           child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 15),),

         ),
       )
   );
  }

}