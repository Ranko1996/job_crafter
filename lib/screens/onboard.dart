import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'dashboard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
    required double height,
  }) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                urlImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              SizedBox(
                height: height,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.blue.shade400, // Ovde postavite željenu plavkastu boju
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                    child: Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 1);
          },
          children: [
            buildPage(
              color: Colors.white,
              urlImage: 'assets/images/page1.jpg',
              title: 'Dobrodošli u JobCrafter',
              subtitle: "Pronađite svoj idealan posao i gradite svoju karijeru s nama.",
              height: 20.0,
            ),
            buildPage(
              color: Colors.white,
              urlImage: 'assets/images/page3.jpg',
              title: 'Otkrijte Mogućnosti za Rast i Razvoj',
              subtitle: "Istražite različite industrije i stvarajte svoj put prema uspjehu.",
              height: 0.0,
            ),
          ],
        ),
      ),
      bottomSheet:
          // isLastPage
          // ? TextButton(
          //     onPressed: () async {
          //       final prefs = await SharedPreferences.getInstance();
          //       prefs.setBool("showLogin", true);
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(
          //           builder: (context) => Dashboard(),
          //         ),
          //       );
          //     },
          //     child: const Text(
          //       "Započnimo",
          //       style: TextStyle(fontSize: 24),
          //     ))
          // :
          Container(
        padding: EdgeInsets.symmetric(),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // TextButton(
            //   // onPressed: () => controller.jumpToPage(2),

            //   onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),

            //   child: const Text("Sljedeća stranica"),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
              child: SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: WormEffect(spacing: 16, dotColor: Colors.black26, activeDotColor: Colors.blue.shade400),
              ),
            ),
            // TextButton(
            //   onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
            //   child: const Text("Next"),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: ElevatedButton(
                // onPressed: () => controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool("showLogin", true);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Podesite vrednost prema želji
                  ),
                ),
                child: Text("Preskoči"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
