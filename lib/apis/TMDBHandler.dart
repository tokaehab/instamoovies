import 'package:dio/dio.dart';
import '../models/Movie.dart';

class TMDBHandler {
  static TMDBHandler _instance = TMDBHandler._private();
  static TMDBHandler get instance => _instance;
  TMDBHandler._private() : _dio = Dio();

  final Dio _dio;
  static const String _apiKey = 'acea91d2bff1c53e6604e4985b6989e2';
  static const _mainUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getMoviesByPage(int page) async {
    String url = '$_mainUrl/discover/movie';
    Map<String, dynamic> params = {
      'api_key': _apiKey,
      'page': page,
    };
    Response response = await _dio.get(url, queryParameters: params);
    List<Movie> movies = (response.data['results'] as List).map((e) {
      return Movie.fromJson(e);
    }).toList();
    return movies;
  }
}
