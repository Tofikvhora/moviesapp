import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapplication/screens/home_screen.dart';
import 'package:moviesapplication/screens/populer.dart';
import 'package:moviesapplication/screens/rating.dart';
import 'package:moviesapplication/screens/upgcoming.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentindex = 0;
  bool isListview = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> Navscreens = [
      Home(
        isListview: isListview,
      ),
      populer(
        isListview: isListview,
      ),
      Rating(
        isListview: isListview,
      ),
      Upcoming(
        isListview: isListview,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: MediaQuery.of(context).size.width * 0.4,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Movies by Tofik",
              style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
        actions: [
          Container(
              width: MediaQuery.of(context).size.width * 0.15,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isListview = !isListview;
                    });
                  },
                  icon: isListview ? Icon(Icons.grid_view) : Icon(Icons.list)))
        ],
      ),
      body: Container(
        child: Navscreens[currentindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentindex,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(213, 240, 216, 3),
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.home),
                label: "Now Playing"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.favorite_border_rounded),
                label: "Popular Movies"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.arrow_outward_rounded),
                label: "Top Rated Movies"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.upcoming_rounded),
                label: "UpComing Movies"),
          ]),
    );
  }
}
