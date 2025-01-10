import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_services.dart';

class RandomJoke extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          title: const Text(
            'Random Joke',
            style: TextStyle(color: Colors.white),
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),),
      body: FutureBuilder<Joke>(
        future: ApiServices.getRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final joke = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${joke.setup}', style: TextStyle(fontSize: 22)),
                  SizedBox(height: 10),
                  Text('${joke.punchline}',
                      style:
                          TextStyle(fontSize: 22)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
