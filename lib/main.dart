import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeferson_Bayking_MidtermExam',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Item> items = [
    Item('Java'),
    Item('C#'),
    Item('Rust'),
    Item('Go'),
    Item('PHP'),
    Item('JavaScript'),
    Item('Ruby'),
    Item('C++'),
    Item('Bisaya'),
    Item('Tagalog'),
    Item('Spanish'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jeferson_Bayking_MidtermExam'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(item: items[index], onDetails: showDetails, onAdd: markAsAdded);
        },
      ),
    );
  }

  void showDetails(String itemName) {
    print('$itemName details displayed.');
  }

  void markAsAdded(Item item) {
    setState(() {
      item.isAdded = true;
    });
  }
}

class Item {
  String name;
  bool isAdded = false;

  Item(this.name);
}

class ItemCard extends StatelessWidget {
  final Item item;
  final Function(String) onDetails;
  final Function(Item) onAdd;

  ItemCard({required this.item, required this.onDetails, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.isAdded ? Colors.green : const Color.fromARGB(255, 172, 155, 155),
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(item.name, style: TextStyle(fontSize: 18)),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onDetails(item.name),
                  child: Text('Details'),
                ),
                ElevatedButton(
                  onPressed: () => onAdd(item),
                  child: Text(item.isAdded ? 'Added' : 'Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
