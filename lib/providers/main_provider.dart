import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{
  Map hash = {};

  void setSortColumn(String columnName){
    hash['sortColumn'] = columnName;
    notifyListeners();
  }
}