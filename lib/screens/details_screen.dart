import 'package:employee_directory/models/employee_model.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Employee emp;
  const Details({Key key, this.emp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Image.network(
                  emp.profileImage??'',
                  height: 150.0,
                  width: 100.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    emp.name,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  emp.phone??'',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Email'),
                  Text(emp.email??''),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                  Text('Website'),
                  Text(emp.website??''),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Address'),
                  Text(emp.address.street+','+emp.address.city),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Company'),
                  Text(emp.company==null?'':emp.company.name),
                ]),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //   Text('Email'),
              //   Text(emp.email??''),
              // ]),
            ],
          ),
        ),
      ),
    );
  }
}

var textStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 10);
