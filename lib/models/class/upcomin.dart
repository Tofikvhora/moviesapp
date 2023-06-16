class upcomingmovies {
  final int id;
  final String title;
  final String posterPath;
  final String release_date;
  final dynamic rating;
  final String overview;

  upcomingmovies(
      {required this.id,
      required this.overview,
      required this.posterPath,
      required this.rating,
      required this.release_date,
      required this.title});

  factory upcomingmovies.fromjson(Map<String, dynamic> json) {
    return upcomingmovies(
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        rating: json["vote_average"],
        release_date: json["release_date"],
        title: json["title"]);
  }
}
