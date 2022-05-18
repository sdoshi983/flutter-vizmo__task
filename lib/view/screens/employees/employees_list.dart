import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vizmo_task/data/constants.dart';

class EmployeesList extends StatefulWidget {
  @override
  State<EmployeesList> createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 4,
          title: Text('Employees'),
          backgroundColor: Constants.kThemeColor,
        ),
    );
  }
}
