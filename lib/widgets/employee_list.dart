import 'package:employee_directory/provider/EmployeeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeListWidget extends StatefulWidget {
  const EmployeeListWidget({Key key}) : super(key: key);

  @override
  _EmployeeListWidgetState createState() => _EmployeeListWidgetState();
}

class _EmployeeListWidgetState extends State<EmployeeListWidget> {
  Future getDetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails = Provider.of<EmployeeProvider>(context, listen: false)
        .getEmployeeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
