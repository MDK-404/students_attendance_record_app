
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:students_attendance_app/models/students.dart';

import 'auth_methods.dart';


class UserProvider with ChangeNotifier{
  Student? _student;
  final AuthMethods _authMethods=AuthMethods();

  Student get getUser => _student!;


  Future<void> refreshUser() async{
    Student user= await _authMethods.getStudentDetails();
    _student= Student as Student?;
    notifyListeners();
  }

}
