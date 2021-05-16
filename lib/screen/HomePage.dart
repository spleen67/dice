import 'package:flutter/material.dart';
import 'DicePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToSs'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print("profile");
        },
        icon: Icon(Icons.account_circle),
        label: Text("Profile"),
      ),
      backgroundColor: Colors.red,
      body: DicePage(),
    );
  }
}
