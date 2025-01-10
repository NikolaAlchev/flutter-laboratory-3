import 'package:flutter/material.dart';
import 'providers/joke_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'screens/register.dart';
import 'screens/random_joke.dart';
import 'screens/favorites_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<JokesProvider>(
          create: (_) => JokesProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const RegisterPage(),
      routes: {
        '/randomJoke': (context) => RandomJoke(),
        '/favouriteJoke': (context) => const FavoritesPage(),
      },
    );
  }
}



