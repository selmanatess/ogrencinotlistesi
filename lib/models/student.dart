class Student {
  late int id;
  late String firstName;
  late String LastName;
  late int grade;
  late String status;

  Student.widthid(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.LastName = lastName;
    this.grade = grade;
    this.status = "Geçti";
  }
  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.LastName = lastName;
    this.grade = grade;
    this.status = "Geçti";
  }
  Student.withoutinfo() {}
  String get getfirstname {
    return "ogr" + this.firstName;
  }

  void set setFirstname(String value) {
    this.firstName = value;
  }

  String get getStatus {
    String message = "";
    if (this.grade <= 50) {
      message = "kaldı";
    } else if (this.grade <= 75) {
      message = "durumu iyi";
    } else {
      message = "durumu cok iyi";
    }

    return message;
  }
}
