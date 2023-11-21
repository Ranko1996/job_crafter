import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/job/job.dart';
import '../services/poslovi/jobs_rest_service.dart';

class SearchResultScreen extends StatefulWidget {
  final String searchTerm;

  SearchResultScreen({required this.searchTerm});

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
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
      var jobsApi = await _jobsRestService.fetchJobs(widget.searchTerm);
      setState(() {
        jobs = jobsApi;
        inspect(jobs);
        inspect(jobsApi);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.searchTerm);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "Pretraga: ${widget.searchTerm}",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 1,
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: ListTile(
            contentPadding: EdgeInsets.all(12),
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    jobs[index].employerLogo ?? '',
                    width: 60,
                    height: 60,
                    fit: BoxFit.contain,
                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                      return const Center(
                        child: Icon(Icons.business, size: 40, color: Colors.grey),
                      );
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobs[index].jobTitle ?? "",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            jobs[index].employerName!.length > 14 ? '${jobs[index].employerName?.substring(0, 13) ?? ''}...' : jobs[index].employerName ?? "",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                            child: Container(
                              width: 90,
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: jobs[index].jobEmploymentType == "PARTTIME"
                                    ? Colors.lightBlue
                                    : jobs[index].jobEmploymentType == "CONTRACTOR"
                                        ? Colors.green
                                        : Colors.orange,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  jobs[index].jobEmploymentType ?? '',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onTap: () {
              print('Pritisnuli ste posao: ${jobs[index].jobTitle}');
            },
          ),
        );
      },
    );
  }
}
