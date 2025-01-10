import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../services/api_services.dart';
import '../widgets/joke_item.dart';

class JokesByType extends StatelessWidget {
  final String type;

  JokesByType({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          title: Text(
            '${type[0].toUpperCase() + type.substring(1, type.length)} Jokes',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),),
      body: FutureBuilder<List<Joke>>(
        future: ApiServices.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final joke = snapshot.data![index];
                return JokeItem(
                  joke: joke,
                );
              },
            );
          }
        },
      ),
    );
  }
}
