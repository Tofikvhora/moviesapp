class topratedmovies {
  final int id;
  final String title;
  final String overview;
  final String releasedate;
  final String posterPath;
  final double rating;

  topratedmovies(
      {required this.id,
      required this.overview,
      required this.releasedate,
      required this.rating,
      required this.posterPath,
      required this.title});

  factory topratedmovies.fromjson(Map<String, dynamic> json) {
    return topratedmovies(
        posterPath: json["poster_path"],
        id: json["id"],
        overview: json["overview"],
        releasedate: json["release_date"],
        rating: json["vote_average"],
        title: json["title"]);
  }
}
