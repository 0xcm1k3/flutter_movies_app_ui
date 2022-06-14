import 'dart:convert';

import 'package:movie_app/app/models/movie.dart';
import 'package:flutter/services.dart' show rootBundle;

class MoviesDatabase {
  static Future<List<Movie>> getMovies() async {
    List<Movie> _moviesList = [];
    String loadedData = await rootBundle.loadString("assets/movies.json");
    List<dynamic> jsonData = json.decode(loadedData);

    for (Map<String, dynamic> _json in jsonData) {
      _moviesList.add(Movie.fromMap(_json));
    }
    _moviesList.shuffle();
    return _moviesList;
  }
}
