import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:movie_app/app/shared/utils/movies_db.dart';

class Movie {
  String title;
  String overview;
  String imageURL;
  List<String> genres;
  String releaseDate;
  Movie({
    required this.title,
    required this.overview,
    required this.imageURL,
    required this.genres,
    required this.releaseDate,
  });
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'overview': overview,
      'imageURL': imageURL,
      'genres': genres,
      'releaseDate': releaseDate,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    final DateFormat formatter = DateFormat('d MMMM yyyy');
    final String formatted = formatter.format(
        DateTime.fromMillisecondsSinceEpoch(map['release_date'] * 1000));
    return Movie(
      title: map['title'] ?? '',
      overview: map['overview'] ?? '',
      imageURL: map['poster'] ?? '',
      genres: List<String>.from(map['genres']),
      releaseDate: formatted,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));

  Future<List<Movie>> getRelated() => MoviesDatabase.getMovies();
}
