import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Image.asset('assets/hakari.jpeg', height: 100),
            SizedBox(height: 20),
            
          
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/data');
              },
              child: Text('Go to Data Page'),
            ),

            
            SizedBox(height: 20), // Add some spacing
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Go to Profile Page'),
            ),
          ],
        ),
      ),
    );
  }
}
