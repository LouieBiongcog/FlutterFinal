import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Profile Page', style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255), // Change text color here
              fontSize: 24,
            ),),
        backgroundColor: const Color.fromARGB(255, 52, 25, 95),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {

            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('Back to Home Page'),
        ),
      ),
    );
  }
}
