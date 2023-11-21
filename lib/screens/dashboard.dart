import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:job_crafter/screens/searched_jobs.dart';

import '../common/jobs_recommendation_slider.dart';
import '../models/job/job.dart';
import '../services/poslovi/jobs_rest_service.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final JobsRestService _jobsRestService = JobsRestService();
  final Dio dio = Dio();
  List<Job> jobs = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    Future.delayed(Duration.zero, () async {
      var jobsApi = await _jobsRestService.fetchJobs('Developer in Croatia');
      setState(() {
        jobs = jobsApi;
        inspect(jobs);
        inspect(jobsApi);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white, // Promijenite boju pozadine
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.white, // Promijenite boju pozadine
            color: Colors.black, // Promijenite boju ikona
            activeColor: Colors.black, // Promijenite boju aktivne ikone
            tabBackgroundColor: Colors.grey.shade200, // Promijenite boju pozadine taba
            padding: EdgeInsets.all(8),
            gap: 8,
            onTabChange: (index) {
              print(index);
            },
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: "Početna",
              ),
              GButton(
                icon: Icons.favorite_border,
                text: "Vaši poslovi",
              ),
              // GButton(icon: Icons.search, text: "Pretraga"),
              GButton(
                icon: Icons.settings_outlined,
                text: "Postavke",
              ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: Container(
      //   color: Colors.black,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //     child: GNav(
      //       backgroundColor: Colors.black,
      //       color: Colors.white,
      //       activeColor: Colors.white,
      //       tabBackgroundColor: Colors.grey.shade800,
      //       padding: EdgeInsets.all(8),
      //       gap: 8,
      //       onTabChange: (index) {
      //         print(index);
      //       },
      //       tabs: const [
      //         GButton(
      //           icon: Icons.home,
      //           text: "Početna",
      //         ),
      //         GButton(
      //           icon: Icons.favorite_border,
      //           text: "Vaši poslovi",
      //         ),
      //         // GButton(icon: Icons.search, text: "Pretraga"),
      //         GButton(
      //           icon: Icons.settings,
      //           text: "Postavke",
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tekst s leve strane
                  Padding(
                    padding: EdgeInsets.fromLTRB(13, 13, 13, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dobrodošli, ',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Radovane',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Slika s desne strane
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                        'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: [
                  // Text input sive boje bez bordera
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        controller: _searchController,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 16, // Prilagodite veličinu fonta prema potrebi
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Pretražite poslove',
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey.shade600,
                            fontSize: 16, // Prilagodite veličinu fonta prema potrebi
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 5.0),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      icon: Image.asset('assets/icons/search.png', color: Colors.white),
                      onPressed: () {
                        // Implementirajte logiku pretrage ovde
                        String searchTerm = _searchController.text;
                        print('Pretražujem poslove za: $searchTerm');
                        _openSearchResultScreen();
                      },
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Preporuke za Vas',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Horizontalni slider sa karticama poslova
              JobsRecomendation(jobs: jobs),
            ],
          ),
        ),
      ),
    );
  }

  void _openSearchResultScreen() {
    String searchTerm = _searchController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultScreen(searchTerm: searchTerm),
      ),
    );
  }
}
