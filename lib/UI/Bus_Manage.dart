import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Manage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
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
         child: Center(child: Text("KSRTC Swift Scania ",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400,fontSize: 22),)),
       ),
       backgroundColor: Colors.black87,
       bottom: PreferredSize(
         preferredSize: Size.fromHeight(30),
         child: SizedBox(
           height: 30,
         ),
       ),
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(13),
             child: Center(
               child: Container(
                 width: MediaQuery.of(context).size.width * 0.98,
                 height: MediaQuery.of(context).size.height * 0.17,
                 decoration: BoxDecoration(
                     color: Colors.black87,
                     borderRadius: BorderRadius.circular(13)
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(right:25),
                           child: Padding(
                             padding: const EdgeInsets.only(left: 13),
                             child: Wrap(
                               direction: Axis.vertical,
                               children: [
                                 Text("Driver",style: TextStyle(fontWeight: FontWeight.w600,
                                     color: Colors.white,
                                     fontSize: 33),),
                                 Text("License no: PJ58684795",style: TextStyle(fontWeight: FontWeight.w300,
                                     color: Colors.white,
                                     fontSize: 15),),
                               ],
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.only(left:7),
                           child: SizedBox(
                               height: 108,
                               width: 122,
                               child: Image(image: AssetImage("assets/image/captain .png"))),
                         )
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.all(15),
             child: Container(
               width: MediaQuery.of(context).size.width * 0.98,
               height: MediaQuery.of(context).size.height * 0.9,
               decoration: BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage("assets/image/busssss.png",),
                       fit: BoxFit.cover
                   )
               ),
             ),
           )
         ],
       ),
     ),
   );
  }

}