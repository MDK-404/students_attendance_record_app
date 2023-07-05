import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Attendance App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: UserDashBoard(),
//     );
//   }
// }

class UserDashBoard extends StatefulWidget {
  @override
  _UserDashBoardState createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {
  bool hasMarkedAttendance = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Panel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: hasMarkedAttendance ? null : markAttendance,
              child: Text('Mark Attendance'),
            ),
          ],
        ),
      ),
    );
  }

  void markAttendance() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    String studentname = '';
    String fatherName = '';
    DateTime currentDate = DateTime.now();

    // Retrieve user details from the "users" collection
    DocumentSnapshot userSnap = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (userSnap.exists) {
      studentname = userSnap.get('studentname') ?? '';
      fatherName = userSnap.get('fathername') ?? '';
    }

    // Check if attendance record already exists for the current user and current date
    DateTime startOfCurrentDate = DateTime(currentDate.year, currentDate.month, currentDate.day);
    DateTime endOfCurrentDate = startOfCurrentDate.add(Duration(days: 1));

    QuerySnapshot attendanceSnapshot = await FirebaseFirestore.instance
        .collection('attendance')
        .where('uid', isEqualTo: uid)
        .where('date', isGreaterThanOrEqualTo: startOfCurrentDate)
        .where('date', isLessThan: endOfCurrentDate)
        .get();

    if (attendanceSnapshot.docs.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('You have already marked your attendance for today.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      try {
        await FirebaseFirestore.instance.collection('attendance').add({
          'uid': uid,
          'studentname': studentname,
          'fatherName': fatherName,
          'date': currentDate,
        });

        setState(() {
          hasMarkedAttendance = true;
        });

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Your attendance has been marked.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      } catch (error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to mark your attendance. Please try again.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }


}