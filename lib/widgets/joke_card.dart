import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  JokeCard({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.0),
      child: ListTile(
          tileColor: Colors.green[50],
        title: Text(title[0].toUpperCase() + title.substring(1, title.length),
            style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,),
        onTap: onTap,
      ),
    );
  }
}
