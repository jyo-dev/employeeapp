import 'package:employee_directory/provider/EmployeeProvider.dart';
import 'package:employee_directory/screens/details_screen.dart';
import 'package:employee_directory/widgets/employee_list.dart';
import 'package:employee_directory/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getDetails;
  TextEditingController editingController = TextEditingController();

  @override
  initState() {
    // TODO: implement initState
    super.initState();

    getDetails = Provider.of<EmployeeProvider>(context, listen: false)
        .getEmployeeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: getDetails,
                builder: (context, snapshot) {
                  var provider = Provider.of<EmployeeProvider>(context);
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: provider.employee.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (editingController.text.isEmpty) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Details(
                                        emp: provider.employee[index],
                                      ),
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.grey,
                                  width: double.infinity,
                                  height: 150,
                                  child: Row(
                                  
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(18.0),
                                          child: Image.network(
                                            provider.employee[index].profileImage ??
                                                '',
                                            height: 150.0,
                                            width: 100.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        child: Column(
                                          mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                  provider.employee[index].name),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(provider.employee[index]
                                                          .company ==
                                                      null
                                                  ? ''
                                                  : provider.employee[index]
                                                      .company.name),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else if (provider.employee[index].name
                                  .toLowerCase()
                                  .contains(editingController.text) ||
                              provider.employee[index].email
                                  .toLowerCase()
                                  .contains(editingController.text)) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Details(
                                        emp: provider.employee[index],
                                      ),
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  color: Colors.grey,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(18.0),
                                          child: Image.network(
                                            provider.employee[index].profileImage ??
                                                '',
                                            height: 150.0,
                                            width: 100.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                        
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(provider
                                                    .employee[index].name),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(provider
                                                            .employee[index]
                                                            .company ==
                                                        null
                                                    ? ''
                                                    : provider.employee[index]
                                                        .company.name),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        });
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: Text('Please wait its loading...'));
                  } else
                    return Center(child: Text('Error: ${snapshot.error}'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
