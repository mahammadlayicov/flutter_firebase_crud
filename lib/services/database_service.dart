import 'package:cloud_firestore/cloud_firestore.dart';

class Database_methods {
  Future add_employee(Map<String, dynamic> employee_info_map, String id) async {
    return await FirebaseFirestore.instance
        .collection('Employee')
        .doc()
        .set(employee_info_map);
  }

  Future<Stream<QuerySnapshot>> get_employee_details() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }

  Future<void> update_employee(
      String id, Map<String, dynamic> info_update) async {

    try {
      await FirebaseFirestore.instance
          .collection("Employee")
          .doc(id)
          .update(info_update);
    } catch (error) {
      print("Failed to update user: $error");
    }
  }
    Future<void> delete_employee(
      String id,) async {

    try {
      await FirebaseFirestore.instance
          .collection("Employee")
          .doc(id)
          .delete();
    } catch (error) {
      print("Failed to update user: $error");
    }
  }
}
