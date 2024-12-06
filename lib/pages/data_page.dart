import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  List<Post> _posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        _posts = data.map((e) => Post.fromJson(e)).toList();
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  // Method to show the edit dialog
  void _editPost(int index) {
    // Create a TextEditingController initialized with the current title
    TextEditingController _controller = TextEditingController(text: _posts[index].title);

    // Show a dialog with a TextField to edit the title
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Post'),
          content: TextField(
            controller: _controller, // Bind the TextEditingController
            decoration: InputDecoration(labelText: 'Post Title'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without making changes
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  // Update the post title with the new value
                  _posts[index].title = _controller.text;
                });
                Navigator.of(context).pop(); // Close the dialog after saving
              },
            ),
          ],
        );
      },
    );
  }

  // Method to delete a post
  void _deletePost(int index) {
    setState(() {
      // Remove the post from the list
      _posts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Page'),
      ),
      body: _posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  post: _posts[index],
                  onEdit: () => _editPost(index), // Pass the edit method to the card
                  onDelete: () => _deletePost(index), // Pass the delete method to the card
                );
              },
            ),
    );
  }
}

class Post {
  final int id;
  String title;  // title should be mutable for editing
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class CustomCard extends StatelessWidget {
  final Post post;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CustomCard({required this.post, required this.onEdit, required this.onDelete, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.body),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete, 
            ),
          ],
        ),
      ),
    );
  }
}
