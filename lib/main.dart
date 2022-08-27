import 'package:engindemirog/models/student.dart';
import 'package:engindemirog/screens/student_add.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Student> students = [
    new Student.widthid(1, "kerim", "Altun", 10),
    new Student.widthid(2, "Esmahan", "Çayır", 100),
    new Student.widthid(3, "Bahri", "Doğru", 101),
    new Student.widthid(4, "Ahmet", "Alin", 45),
    new Student.widthid(5, "İsmet Sefa", "Özyon", 85),
    new Student.widthid(6, "Ercan", "Alataş", 150),
    new Student.widthid(7, "Kenan", "Çevik", 95),
    new Student.widthid(8, "Vahap", "Dinç", 65)
  ];

  Student selectedStudent = Student.widthid(0, "", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody(context));
  }

  buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: CircleAvatar(),
                    title: Text(students[index].firstName.toString() +
                        " " +
                        students[index].LastName.toString()),
                    subtitle: Text("sınavdan Aldığı Not:  " +
                        students[index].grade.toString() +
                        "[" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () => {
                          setState(() => {selectedStudent = students[index]}),
                          print(selectedStudent.firstName)
                        });
              }),
        ),
        Text("Seçili Öğrenci:" + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 1.0,
                    ),
                    Text("Yeni Öğrenci Ekle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentAdd()));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    child: Row(
                      children: [
                        Icon(Icons.update),
                        SizedBox(
                          width: 1.0,
                        ),
                        Text("Güncelle"),
                      ],
                    ),
                    onPressed: () {
                      var mesaj = "Güncellendi" + selectedStudent.firstName;
                      mesajGonder(context, mesaj);
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 1.0,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var mesaj = "Silindi  " + selectedStudent.firstName;
                  mesajGonder(context, mesaj);
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade <= 50) {
      return Icon(Icons.clear);
    } else if (grade <= 75) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.done);
    }
  }
}

void mesajGonder(BuildContext context, String mesaj) {
  var alert = AlertDialog(
    title: Text("İşlem Sonucu"),
    content: Text(mesaj),
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}
