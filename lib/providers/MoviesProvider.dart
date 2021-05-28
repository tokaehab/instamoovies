import 'package:flutter/material.dart';
import '../apis/TMDBHandler.dart';
import '../models/Movie.dart';

class MoviesProvider with ChangeNotifier {
  List<Movie> _movies;
  int lastPage;
  MoviesProvider() {
    _movies = [];
    lastPage = 0;
  }
  List<Movie> get movies => [..._movies];

  Future<bool> loadMovies() async {
    try {
      List<Movie> loadedMovies =
          await TMDBHandler.instance.getMoviesByPage(++lastPage);
      _movies.addAll(loadedMovies);
      notifyListeners();
      return true;
    } catch (e) {
      lastPage--;
      print(e);
      notifyListeners();
      return false;
    }
  }
}
