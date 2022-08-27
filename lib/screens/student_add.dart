import 'package:engindemirog/Validation/student_validator.dart';
import 'package:flutter/material.dart';


import '../models/student.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudentAddState();
  }
}

class StudentAddState extends State with studentValidationMixin {
  var student = Student.withoutinfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Öğrenci Adı", hintText: "Selman Ateş"),validator:validateFirstName,onSaved:(String Value) {
                        
                      }),)

            ],
          ),
        ),
      ),
    );
  }
}
