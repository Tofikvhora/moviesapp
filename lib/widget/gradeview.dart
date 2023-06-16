import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:moviesapplication/page/moviedetails.dart';

class grideviewclass extends StatefulWidget {
  final List<dynamic> movies;
  const grideviewclass(this.movies, {super.key});

  @override
  State<grideviewclass> createState() => _grideviewclassState();
}

class _grideviewclassState extends State<grideviewclass> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10),
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          final movie = widget.movies[index];

          return GestureDetector(
            onTap: () {
              Get.to(MovieDetailsPage(movieId: widget.movies[index].id));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Image.network(
                          'https://image.tmdb.org/t/p/w200${movie.posterPath}')),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  movie.title,
                                  style: GoogleFonts.lato(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
