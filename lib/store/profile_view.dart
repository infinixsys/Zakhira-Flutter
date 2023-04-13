import 'package:flutter/material.dart';

class SelllerProfileScreen extends StatelessWidget {
  const SelllerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: const Text("Seller Name"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("ID:cxhhdz"),
                    Text("JOB Title:Seles manager")
                  ],
                ),
              ),
            ),
            const ListTile(
              title: Text("Company"),
              subtitle: Text("Ny Clothes"),
              trailing: Icon(
                Icons.more_horiz_rounded,
                color: Colors.black54,
              ),
            ),
            const ListTile(
              title: Text("Location"),
              subtitle: Text("Delhi india uttam nagar new delhi -110044400"),
              trailing: Icon(Icons.more_horiz_rounded, color: Colors.black54),
            ),
            const Divider(),
            const ListTile(
              title: Text("Email"),
              subtitle: Text("Hidden"),
            )
          ],
        ),
      ),
    );
  }
}
