import 'package:flutter/material.dart';
import '../models/joke.dart';
import '../main.dart';
import '../providers/joke_provider.dart';
import 'package:provider/provider.dart';

class JokeItem extends StatefulWidget {
  const JokeItem({super.key, required this.joke});
  final Joke joke;

  @override
  State<JokeItem> createState() => _JokeItemState();
}

class _JokeItemState extends State<JokeItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.joke.setup, style: TextStyle(fontSize: 18),),
                Text(widget.joke.punchline, style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              // color: Colors.red,
              onPressed: () {
                context.read<JokesProvider>().toggleFavorite(widget.joke);
              },
              color: widget.joke.isFavorite ? Colors.red : Colors.blueGrey,
              icon: const Icon(Icons.favorite),
            ),
          ),
        ],
      ),
    );
  }
}
