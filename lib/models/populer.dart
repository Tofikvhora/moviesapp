import 'package:moviesapplication/models/class/populer.dart';

import '../screens/populer.dart';

class populermodel {
  final List<Populermmovie> results;
  populermodel({required this.results});

  factory populermodel.fromjson(Map<String, dynamic> json) {
    return populermodel(
        results: List<Populermmovie>.from(
            json["results"].map((x) => Populermmovie.fromjson(x))));
  }
}
