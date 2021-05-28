import 'package:flutter/material.dart';
import './providers/MoviesProvider.dart';
import './screens/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoviesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'InstaMovies',
        theme: ThemeData(
          primaryColor: Colors.deepPurple[800],
          accentColor: Colors.white,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
