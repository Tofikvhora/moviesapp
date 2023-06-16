import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Listviewclass extends StatefulWidget {
  final List<dynamic> movies;
  const Listviewclass(this.movies, {super.key});

  @override
  State<Listviewclass> createState() => _ListviewclassState();
}

class _ListviewclassState extends State<Listviewclass> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.movies.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        final movie = widget.movies[index];
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Image.network(
                            "https://image.tmdb.org/t/p/w200${movie.posterPath}",
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.06),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(movie.title.toString(),
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                decoration:
                                                    TextDecoration.none),
                                            fontSize: 18,
                                            color: Colors.white)),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Rating: ${movie.rating.toString()}",
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                              decoration: TextDecoration.none),
                                          fontSize: 20,
                                          color: Colors.white)),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.2),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.0005,
              decoration: BoxDecoration(color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.0005,
              decoration: BoxDecoration(color: Colors.blueGrey),
            ),
          ],
        );
      },
    );
  }
}
