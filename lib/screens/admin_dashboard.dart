import 'package:flutter/material.dart';
class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        centerTitle: true,
      ),
      body: Container(

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/Login.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
