import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final myIcon = Icon(
  Icons.settings,
  size: 50,
  color: Color.fromARGB(255, 17, 0, 255),
);

final star = Icon(
  Icons.star,
  size: 50,
  color: const Color.fromARGB(255, 229, 255, 0),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/hakari.jpeg'),
                  ),
                  SizedBox(width: 36),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kinji Hakari',
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(
                          'Jujutsu Kaisen',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity, 
                          child: ElevatedButton.icon(
                            onPressed: () {
                              print('Confirmation Successful!');
                            },
                            icon: Icon(Icons.check),
                            label: Text('Confirm'),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity, 
                          child: ElevatedButton.icon(
                            onPressed: () {
                              print('Confirmation Successful!');
                            },
                            icon: Icon(Icons.check),
                            label: Text('Confirm'),
                          ),
                        ),
                        Text('Si Raymart kay gwapo kaayo. The quick little brown fox jumps over the lazy dog near the bank of the river',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
             
            ],
          ),
        ),
      ),
    );
  }
}
