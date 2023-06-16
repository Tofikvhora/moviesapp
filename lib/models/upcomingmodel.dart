import 'package:moviesapplication/models/class/upcomin.dart';

class upcomingmodels {
  final List<upcomingmovies> result;
  upcomingmodels({required this.result});

  factory upcomingmodels.fromjson(Map<String, dynamic> json) {
    return upcomingmodels(
        result: List<upcomingmovies>.from(
      json["results"].map((x) => upcomingmovies.fromjson(x)),
    ));
  }
}
