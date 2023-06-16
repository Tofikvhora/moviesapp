import 'package:flutter/foundation.dart';

class Populermmovie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String release_date;
  final dynamic rating;

  Populermmovie(
      {required this.id,
      required this.overview,
      required this.posterPath,
      required this.rating,
      required this.release_date,
      required this.title});
  factory Populermmovie.fromjson(Map<String, dynamic> json) {
    return Populermmovie(
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        rating: json["vote_average"],
        release_date: json["release_date"],
        title: json["title"]);
  }
}
