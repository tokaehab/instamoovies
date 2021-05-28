import 'package:flutter/material.dart';
import '../widgets/MoviesList.dart';
import '../widgets/myAppBar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('InstaMoovies'),
      ),
      body: MoviesList(),
    );
  }
}
