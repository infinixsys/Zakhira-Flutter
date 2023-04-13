import 'package:flutter/material.dart';

class InventoryUpdate extends StatefulWidget {
  const InventoryUpdate({super.key});

  @override
  State<InventoryUpdate> createState() => _InventoryUpdateState();
}

class _InventoryUpdateState extends State<InventoryUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Divider(
              color: Colors.grey,
            ),
            const ListTile(
              title: Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
              trailing: Text(
                "0",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const ListTile(
              title: Text(
                "Availble",
              ),
              trailing: Text("0", style: TextStyle(fontSize: 18.0)),
            ),
            const ListTile(
              title: Text(
                "Total",
              ),
              trailing: Text("0", style: TextStyle(fontSize: 18.0)),
            ),
            const ListTile(
              title: Text(
                "Total",
              ),
              trailing: Text("0", style: TextStyle(fontSize: 18.0)),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 2.0,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const ListTile(
              title: Text(
                "Total(other)",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
              trailing: Text(
                "0",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const ListTile(
              title: Text(
                "Unfulfuliable",
              ),
              trailing: Text("0", style: TextStyle(fontSize: 18.0)),
            ),
            const ListTile(
              title: Text(
                "Customer Order",
              ),
              trailing: Text("0", style: TextStyle(fontSize: 18.0)),
            ),
            const ListTile(
              title: Text(
                "Fc Processing",
              ),
              trailing: Text("0", style: TextStyle(fontSize: 18.0)),
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Inventory age by days",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
            ),
              const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:const [
                  SizedBox(height: 10.0,),
                  Text("0-90",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
                  Text("91-180",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
                  Text("181-270",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
                  Text("271-365",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
                  Text("365+",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
                   SizedBox(height: 10.0,),
                ],
              ),
              
            ),
            const Divider(color: Colors.grey,),
            const Divider(color: Colors.grey,),
              SizedBox(height: 10.0,),
                const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Excessive inventory",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
            ),
            SizedBox(height: 10.0,),
             const Divider(color: Colors.grey,),
              SizedBox(height: 10.0,),
                const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Days of supply",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
            ),
            SizedBox(height: 10.0,),
             const Divider(color: Colors.grey,),
              SizedBox(height: 10.0,),
                const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Supplier",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
            ),
            SizedBox(height: 10.0,),
             const Divider(color: Colors.grey,),
              SizedBox(height: 10.0,),
                const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Supplier lead time",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
            ),
            SizedBox(height: 10.0,),
             const Divider(color: Colors.grey,),
              SizedBox(height: 10.0,),
                const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text("Reorder frequency",style: TextStyle(fontSize: 18.0,color: Colors.grey),),
            ),
            SizedBox(height: 10.0,),
             const Divider(color: Colors.grey,),
          ]
        ),
      ),
    );
  }
}
