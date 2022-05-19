// contains all the routing part

import 'package:flutter/material.dart';
import 'package:vizmo_task/view/screens/employees/employee_detail.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/EmployeeDetail':
        return MaterialPageRoute(builder: (_) => EmployeeDetail(employeeDetails: (args as EmployeeDetail).employeeDetails,));
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
