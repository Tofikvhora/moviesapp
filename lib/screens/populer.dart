import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moviesapplication/models/class/populer.dart';
import 'package:moviesapplication/models/moviesmodels.dart';
import 'package:moviesapplication/models/populer.dart';
import 'package:moviesapplication/widget/ListView.dart';
import 'package:moviesapplication/widget/gradeview.dart';

class populer extends StatefulWidget {
  final bool isListview;
  const populer({required this.isListview, super.key});

  @override
  State<populer> createState() => _populerState();
}

class _populerState extends State<populer> {
  List<Populermmovie> movies = [];
  @override
  void initState() {
    super.initState();

    Fatcingpopulermovie();
  }

  Future<void> Fatcingpopulermovie() async {
    final response = await Dio().get(
      "https://api.themoviedb.org/3/movie/popular",
      options: Options(
        headers: {
          'accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MGIxN2EyZDU5ZTE4NmNiNDdmMWQyMTViY2I3MDU2YSIsInN1YiI6IjY0Njg1ZTgzMzNhMzc2MDE3NWQyOTE4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hlDOkFEh5T8yEBrMo7sz6HE4s99XQBhvbaAqo-sarvk',
        },
      ),
    );
    final nowplayingmodel = populermodel.fromjson(response.data);
    setState(() {
      movies = nowplayingmodel.results;
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
