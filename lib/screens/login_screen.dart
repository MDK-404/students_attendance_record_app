import 'package:flutter/material.dart';
import 'package:students_attendance_app/screens/user_dashboard.dart';

class Login_Screen extends StatefulWidget {

  const Login_Screen({Key? key,}) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Container(

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/Login.jpg'),
            fit: BoxFit.fill,
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Please Enter Email & Password to Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  // SizedBox(height: 16),
                  const SizedBox(height: 32),
                  TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    style: const TextStyle(color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'user_dashboard');
                    },
                    child: Text("login") ,
                  ),
                  const SizedBox(height: 16),
                  InkWell(

                    child: TextButton(

                      onPressed: () {
                        Navigator.pushNamed(context, 'signup');
                      },
                      child: const Text(
                        "Didn't have an account? Create First",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff4c505b),
                          fontSize: 18,
                        ),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'forgot');
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(

                          decoration: TextDecoration.underline,
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                      style: ButtonStyle(

                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'start');
                    },
                    child: const Text(
                      'Back to Start',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xff4c505b),
                        fontSize: 18,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}