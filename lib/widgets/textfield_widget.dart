import 'package:flutter/material.dart';

class Textfield_widget extends StatelessWidget {
  TextEditingController? textEditingController;
  String title;
   Textfield_widget(
      {super.key, this.textEditingController, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            controller: textEditingController,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        )
      ],
    );
  }
}
