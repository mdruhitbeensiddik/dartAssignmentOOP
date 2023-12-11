
abstract class Role {
  void displayRole();
}


class Person {
  String name;
  int age;
  String address;
  final Role assignedRole; // Change the variable name

  Person(this.name, this.age, this.address, this.assignedRole);

  String getName() => name;
  int getAge() => age;
  String getAddress() => address;
}


class Student extends Person {
  int studentID;
  String grade;
  List<double> courseScores = [];

  Student(
      String name, int age, String address, Role assignedRole, this.studentID, this.grade)
      : super(name, age, address, assignedRole);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) {
      return 0.0;
    }
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

class Teacher extends Person {
  int teacherID;
  List<String> coursesTaught = [];

  Teacher(
      String name, int age, String address, Role assignedRole, this.teacherID)
      : super(name, age, address, assignedRole);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (String course in coursesTaught) {
      print(" - $course");
    }
  }
}


void main() {

  Student johnDoe = Student(
      "John Doe", 20, "123 Main St", StudentRole(), 12345, "10th");
  johnDoe.courseScores.addAll([90, 85, 82]);


  Teacher mrsSmith = Teacher(
      "Mrs. Smith", 35, "456 Oak St", TeacherRole(), 54321);
  mrsSmith.coursesTaught.addAll(["Math", "English", "Bangla"]);

  print("Student Information:");
  johnDoe.displayRole();
  print("Name: ${johnDoe.getName()}");
  print("Age: ${johnDoe.getAge()}");
  print("Address: ${johnDoe.getAddress()}");
  print("Average Score: ${johnDoe.calculateAverageScore()}");

  print("\nTeacher Information:");
  mrsSmith.displayRole();
  print("Name: ${mrsSmith.getName()}");
  print("Age: ${mrsSmith.getAge()}");
  print("Address: ${mrsSmith.getAddress()}");
  mrsSmith.displayCoursesTaught();
}

class StudentRole implements Role {
  @override
  void displayRole() => print("Role: Student");
}

class TeacherRole implements Role {
  @override
  void displayRole() => print("Role: Teacher");
}
