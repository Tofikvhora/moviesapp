import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moviesapplication/models/class/upcomin.dart';
import 'package:moviesapplication/models/upcomingmodel.dart';
import 'package:moviesapplication/widget/ListView.dart';
import 'package:moviesapplication/widget/gradeview.dart';

class Upcoming extends StatefulWidget {
  final bool isListview;
  const Upcoming({required this.isListview, super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List<upcomingmovies> movies = [];
  @override
  void initState() {
    fatchingupcomingmovies();
    super.initState();
  }

  Future<void> fatchingupcomingmovies() async {
    final response = await Dio().get(
        "https://api.themoviedb.org/3/movie/upcoming?api_key=ca156761829d7741266047bb0d31be58");
    final upcomingmodel = upcomingmodels.fromjson(response.data);

    setState(() {
      movies = upcomingmodel.result;
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
