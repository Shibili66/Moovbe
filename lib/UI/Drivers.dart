import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider.dart';
import 'AddDriver.dart';
import 'Home.dart';

class Drivers extends StatefulWidget {
  const Drivers({super.key});

  @override
  State<Drivers> createState() => _DriversState();
}

class _DriversState extends State<Drivers> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BusProvider>();
    print(provider.drivers);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> home()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Icon(Icons.arrow_back,color:Colors.white),
            )),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(right:40,top: 30),
          child: Center(child: Text("Driver List",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400,fontSize: 22),)),
        ),
        backgroundColor: Colors.black87,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: SizedBox(
            height: 30,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        provider.drivers[index]['id'].toString()
                    ),
                    Text(
                        provider.drivers[index]['name'] ?? "-"
                    ),
                    Text(
                        provider.drivers[index]['mobile'] ?? "-"
                    ),
                    Text(
                        provider.drivers[index]['license_no'] ?? "-"
                    ),
                  ],
                ),
              )
          );
        },
        itemCount: provider.drivers.length,
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
          child: Text("Add Driver",style: TextStyle(color: Colors.white,fontSize: 15),),

        ),
      )
    );
  }
}