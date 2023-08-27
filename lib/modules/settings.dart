import 'package:flutter/material.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "News", style: TextStyle(color: Colors.black, fontSize: 22,
                fontWeight: FontWeight.w500),),
            Text(
              "Cloud", style: TextStyle(color: Colors.amber, fontSize: 22,
                fontWeight: FontWeight.w500),)
          ],
        ),
      ),
      body: Center(child: Text("Settings",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
    );
  }
}
