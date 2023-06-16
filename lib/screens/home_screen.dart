// Packages
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapplication/models/class/plaing.dart';
import 'package:moviesapplication/models/moviesmodels.dart';
import 'package:moviesapplication/widget/ListView.dart';
import 'package:moviesapplication/widget/gradeview.dart';

class Home extends StatefulWidget {
  final bool isListview;
  Home({
    super.key,
    required this.isListview,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<NowPlayingMovie> movies = [];

  @override
  void initState() {
    super.initState();
    fetchNowPlayingMovies();
  }

  Future<void> fetchNowPlayingMovies() async {
    try {
      final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MGIxN2EyZDU5ZTE4NmNiNDdmMWQyMTViY2I3MDU2YSIsInN1YiI6IjY0Njg1ZTgzMzNhMzc2MDE3NWQyOTE4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hlDOkFEh5T8yEBrMo7sz6HE4s99XQBhvbaAqo-sarvk',
          },
        ),
      );

      final nowPlayingModel = NowPlayingModel.fromJson(response.data);
      setState(() {
        movies = nowPlayingModel.results;
      });
    } catch (error) {
      print('Request failed with error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Expanded(
              child: widget.isListview
                  ? Listviewclass(movies)
                  : grideviewclass(movies)),
        ],
      ),
    );
  }
}
