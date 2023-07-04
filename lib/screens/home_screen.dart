import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/Login.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.transparent,// Replace with desired color
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle User Panel button pressed
                        Navigator.pushNamed(context, 'user login');
                      },
                      child: Text('User Panel'),
                    ),
                    SizedBox(height: 20), // Adjust the spacing between the buttons
                    ElevatedButton(
                      onPressed: () {
                        // Handle Admin Panel button pressed
                        Navigator.pushNamed(context, '/admin');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Replace with desired button color
                        // Other button customization properties can be added here

                      ),
                      child: Text('Admin Panel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
