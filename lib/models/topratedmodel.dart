import 'package:moviesapplication/models/class/toprated.dart';

class topratedmodel {
  final List<topratedmovies> result;
  topratedmodel({required this.result});

  factory topratedmodel.fromjson(Map<String, dynamic> json) {
    return topratedmodel(
        result: List<topratedmovies>.from(
      json["results"].map((x) => topratedmovies.fromjson(x)),
    ));
  }
}
