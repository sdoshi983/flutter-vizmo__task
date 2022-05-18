import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vizmo_task/data/constants.dart';
import 'package:vizmo_task/view/screens/employees/employees_list.dart';
import 'package:vizmo_task/view/screens/profile/profile.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  List tabs = [
    EmployeesList(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Constants.kThemeColor,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.people_alt, color: Constants.kThemeColor,),
              icon: Icon(Icons.people_alt),
              label: 'Employees',
              // backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person, color: Constants.kThemeColor,),
              icon: Icon(Icons.person),
              label: 'Profile',
              // backgroundColor: Colors.red,
            ),
          ],
        ));
  }
}
