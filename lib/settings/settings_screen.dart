import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/core/style/my_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text("language",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
            Text("mode",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

}
