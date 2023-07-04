import 'package:cloud_firestore/cloud_firestore.dart';
class AttendanceRecord{
  final String studentname;
  final  String fathername;
  final String email;
  final String uid;
  final  date;
  final int attendanceCount;

  const AttendanceRecord({
    required this.studentname,
    required this.fathername,
    required this.email,
    required this.uid,
    required this.date,
    required this.attendanceCount,
  });

  Map<String, dynamic> toJson()=> {
    "studentname":studentname,
    "fathername": fathername,
    "email": email,
    "uid": uid,
    "date": date,
    "attendanceCount": attendanceCount
  };

  static AttendanceRecord fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;

    return AttendanceRecord(
      studentname: snapshot['studentname'],
      fathername: snapshot['fathername'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      date: snapshot['date'],
        attendanceCount: snapshot['attendanceCount']

    );
  }

}