import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vizmo_task/data/constants.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text('Profile'),
        backgroundColor: Constants.kThemeColor,
      ),
      body: Center(
        child: Text(
          'Profile Module ...',
          style: TextStyle(
            fontSize: Constants.width * 0.05
          ),
        ),
      ),
    );
  }
}
