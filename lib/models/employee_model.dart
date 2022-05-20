// this file contains all the api call functions

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vizmo_task/helpers/urls.dart';

class EmployeeModel{
  static Future<dynamic> getEmployeesList(int pageKey, int limit, String sortBy) async {
    try{    // exception handling
      var response;
      if(sortBy == 'none')
        response = await http.get(Uri.parse(getEmployeesListApi + '?page=$pageKey&limit=$limit'));
      else
        response = await http.get(Uri.parse(getEmployeesListApi + '?sortBy=$sortBy&page=$pageKey&limit=$limit'));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return data;
      }else{
        return [];
      }
    }catch(e){
      print("EmployeeModel model: getEmployeesList " + e.toString());
      return [];
    }
  }

  static Future<dynamic> getEmployeeCheckIns(String employeeId) async {
    try{  // exception handling
      var response = await http.get(Uri.parse(getEmployeeCheckInsApi + employeeId + '/checkin'));
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        return data;
      }else{
        return [];
      }
    }catch(e){
      print("EmployeeModel model: getEmployeeCheckIns " + e.toString());
      return [];
    }
  }
}