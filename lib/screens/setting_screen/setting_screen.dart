
import 'package:education_system/extensions/relative_length.dart';
import 'package:education_system/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 4.5.vh,
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.97.vh, left: 4.3.vw, right: 4.3.vw),
            child: const SearchBar(),
          ),
          SizedBox(
            height: 4.5.vh,
          ),
          const Text(
            'Settings',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
