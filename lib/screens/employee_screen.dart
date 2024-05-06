import 'package:firebase_crud/services/database_service.dart';
import 'package:firebase_crud/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Employee_screen extends StatefulWidget {
  const Employee_screen({super.key});

  @override
  State<Employee_screen> createState() => _Employee_screenState();
}

class _Employee_screenState extends State<Employee_screen> {
  @override
  void initState() {
    super.initState();
    // Implement some initialization operations here.
  }

  TextEditingController nameT = TextEditingController();
  TextEditingController ageT = TextEditingController();
  TextEditingController locationT = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Add',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' Employee',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Textfield_widget(
                textEditingController: nameT,
                title: "Name",
              ),
              SizedBox(
                height: 20,
              ),
              Textfield_widget(
                textEditingController: ageT,
                title: "Age",
              ),
              SizedBox(
                height: 20,
              ),
              Textfield_widget(
                textEditingController: locationT,
                title: "Location",
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15)),
                child: GestureDetector(
                  onTap: () async {
                    String id = randomAlphaNumeric(10);
                    Map<String, dynamic> employee = {
                      "name": nameT.text,
                      "age": ageT.text,
                      "id": id,
                      "location": locationT.text,
                    };
                    await Database_methods()
                        .add_employee(employee, id)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: "add employee successfull",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                  },
                  child: Center(
                      child: Text("Add",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                ),
              )
            ],
          ),
        ));
  }
}
