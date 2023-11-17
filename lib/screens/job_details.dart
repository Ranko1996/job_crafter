import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/job/job.dart';

class JobDetailsScreen extends StatelessWidget {
  final Job job; // Očekujem da imate definiranu klasu Job

  JobDetailsScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalji o poslu',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Promijenite boju naslova na crnu
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Ukloniti sjenu ispod AppBar-a
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black, // Promijenite boju strelice na crnu
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      job.employerLogo ?? '',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        return const Icon(Icons.business, size: 60, color: Colors.grey);
                      },
                    ),
                  ),
                ),
              ),
              // Center(
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(12.0),
              //     child: Image(
              //       image: NetworkImage(job.employerLogo ?? ''),
              //       width: 150,
              //       height: 150,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              SizedBox(height: 20),
              Text(
                job.jobTitle!,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildDetailRow('Poslodavac', job.jobPublisher ?? 'N/A', Colors.black),
              _buildDetailRow(
                'Objavljeno',
                DateFormat('dd.MM.yyyy HH:mm').format(DateTime.parse(job.jobPostedAtDatetimeUtc!)),
                Colors.black,
              ),
              _buildDetailRow(
                'Ističe',
                DateFormat('dd.MM.yyyy HH:mm').format(DateTime.parse(job.jobOfferExpirationDatetimeUtc!)),
                Colors.black,
              ),
              SizedBox(height: 20),
              Text(
                'Opis posla',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ExpansionTile(
                title: Text(
                  'Prikaži opis posla',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      child: Text(
                        job.jobDescription ?? 'Nema dostupnog opisa posla.',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.orange,
                ),
                child: TextButton(
                  onPressed: () {
                    // Implementirajte logiku za prijavu
                  },
                  child: Text(
                    'Prijavi se',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$title:',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          SizedBox(width: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
