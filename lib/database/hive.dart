import 'package:hive/hive.dart';
import 'package:sutdent_provider/utils/hive_box.dart';
import 'package:sutdent_provider/models/student_model.dart';

class HiveHelper {
  static Box<StudentModel> box = Hive.box(studentbox);

  static Future<void> addStudent(StudentModel student) async {
    try {
      await box.add(student);
    } catch (e) {
      // Handle the error
      print('Error adding student: $e');
    }
  }

  static Future<void> deleteStudent(var key) async {
    try {
      await box.delete(key);
    } catch (e) {
      // Handle the error
      print('Error deleting student: $e');
    }
  }

  static Future<void> updateStudent(var key, StudentModel student) async {
    try {
      await box.put(key, student);
    } catch (e) {
      // Handle the error
      print('Error updating student: $e');
    }
  }

  static Future<List<StudentModel>> getAllStudents() async {
    try {
      return box.values.toList();
    } catch (e) {
      // Handle the error
      print('Error getting all students: $e');
      return []; // Return an empty list in case of error
    }
  }
}
