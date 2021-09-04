import 'dart:convert';

import 'package:employee_directory/models/employee_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EmployeeProvider extends ChangeNotifier {
  List<Employee> employee;

  getDetailsFromDB() async {
    print(">>>>GetDeatilsFromDB");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String employeeList = await prefs.getString('employeelist');
    employee = employeeFromJson(jsonDecode(employeeList));
  }

  Future getEmployeeDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDataStored = prefs.getBool('isDataStored') ?? false;
    if (isDataStored) {
      getDetailsFromDB();
    } else {
      print(">>>>GetDeatilsFromURL");
      Uri url = Uri.parse("http://www.mocky.io/v2/5d565297300000680030a986");

      // Await the http get response, then decode the json-formatted response.
      final response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        employee = employeeFromJson(response.body);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String encodedData = jsonEncode(response.body);
        await prefs.setString('employeelist', encodedData);
        await prefs.setBool('isDataStored', true);
        print(employee.length);
        print(employee);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }
}
