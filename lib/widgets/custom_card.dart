import 'package:flutter/material.dart';
import '../models/post.dart';

class CustomCard extends StatelessWidget {
  final Post post;
  final Function onDelete;
  final Function onEdit;

  CustomCard({required this.post, required this.onDelete, required this.onEdit});

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
              onPressed: () => onEdit(),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => onDelete(),
            ),
          ],
        ),
      ),
    );
  }
}
