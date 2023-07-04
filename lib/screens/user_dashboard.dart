import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDashBoard extends StatelessWidget {
  final String uid; // Assuming you have the student ID

  UserDashBoard({required this.uid});

  void markAttendance(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DocumentSnapshot attendanceSnapshot = await FirebaseFirestore.instance
        .collection('attendance')
        .doc(currentDate.toString())
        .get();

    if (attendanceSnapshot.exists) {
      // Attendance already marked for the day
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Attendance already marked'),
            content: Text('You have already marked your attendance for today.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Mark attendance for the current date
      await FirebaseFirestore.instance
          .collection('attendance')
          .doc(currentDate.toString())
          .set({'uid': uid});

      // Display success message or perform any other actions
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Attendance marked'),
            content: Text('Your attendance for today has been marked successfully.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Panel'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mark Attendance'),
          onPressed: () => markAttendance(context), // Pass the context here
        ),
      ),
    );
  }
}