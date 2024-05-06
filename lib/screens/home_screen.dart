import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/screens/employee_screen.dart';
import 'package:firebase_crud/services/database_service.dart';
import 'package:firebase_crud/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  void initState() {
    get_one_reload();
    super.initState();
    // Implement some initialization operations here.
  }

  TextEditingController nameT = TextEditingController();
  TextEditingController ageT = TextEditingController();
  TextEditingController locationT = TextEditingController();
  Stream? employee_stream;
  get_one_reload() async {
    employee_stream = await Database_methods().get_employee_details();
    setState(() {});
  }

  String? id;
  Widget all_employee() {
    return StreamBuilder(
      stream: employee_stream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Material(
                        borderRadius: BorderRadius.circular(8),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Name:" + documentSnapshot["name"],
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold)),
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      nameT.text = documentSnapshot["name"];
                                      ageT.text = documentSnapshot["age"];
                                      locationT.text =
                                          documentSnapshot["location"];
                                      edit_employee(documentSnapshot.id);
                                    },
                                  ),
                                ],
                              ),
                              Text("Age:" + documentSnapshot["age"],
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold)),
                              Text("Location:" + documentSnapshot["location"],
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        )),
                  );
                })
            : Container();
      },
    );
  }

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
                    text: 'Firebase',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: ' CRUD',
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Employee_screen(),
            ));
          },
          child: Icon(Icons.add)),
      body: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [Expanded(child: all_employee())],
          )),
    );
  }

  Future edit_employee(String id) => showDialog(
        builder: (context) => AlertDialog(
          content: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: Icon(Icons.cancel),
                      onTap: () {
                        Navigator.of(context).pop(); // Dialog penceresini kapat
                      },
                    ),
                  ],
                ),
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
                ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> info = {
                      "name": nameT.text,
                      "age": ageT.text,
                      "id": id,
                      "location": locationT.text,
                    };
                    await Database_methods()
                        .update_employee(id, info)
                        .then((value) {
                      print("User Updated");
                      Navigator.pop(context);
                    }).catchError((error) {
                      print("Failed to update user: $error");
                    });
                  },
                  child: Text("Update"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Database_methods().delete_employee(id).then((value) {
                      print("User Delete");
                      Navigator.pop(context);
                    }).catchError((error) {
                      print("Failed to update user: $error");
                    });
                  },
                  child: Text("Delete"),
                )
              ],
            ),
          ),
        ),
        context: context,
      );
}
