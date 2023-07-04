import 'package:cloud_firestore/cloud_firestore.dart';

class Student{
  final String email;
  final String uid;
  final String photoUrl;
  final String studentname;
  final  String fathername;


  const Student({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.studentname,
    required this.fathername,

  });


  Map<String, dynamic> toJson()=> {
    "studentname":studentname,
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,
    "fathername": fathername,


  };

  static Student fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;

    return Student(
      studentname: snapshot['studentname'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
      fathername: snapshot['fathername'],

    );
  }
}