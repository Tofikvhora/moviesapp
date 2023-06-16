import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moviesapplication/models/class/toprated.dart';
import 'package:moviesapplication/models/topratedmodel.dart';
import 'package:moviesapplication/widget/ListView.dart';
import 'package:moviesapplication/widget/gradeview.dart';

class Rating extends StatefulWidget {
  final bool isListview;
  const Rating({required this.isListview, super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  List<topratedmovies> movies = [];

  @override
  void initState() {
    super.initState();

    Fatchingratedmovies();
  }

  Future<void> Fatchingratedmovies() async {
    final response = await Dio().get(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=ca156761829d7741266047bb0d31be58");
    final nowtopmodel = topratedmodel.fromjson(response.data);
    setState(() {
      movies = nowtopmodel.result;
    });
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
