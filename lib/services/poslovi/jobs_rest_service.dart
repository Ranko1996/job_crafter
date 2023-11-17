import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../../models/job/job.dart';

class JobsRestService {
  final dio = Dio();

  Future<List<Job>> fetchJobs() async {
    List<Job> resultList = [];
    const String apiKey = 'f647a48ac6msh21da85d7774ca16p1b6f27jsnf32cf39f5137';
    const String host = 'jsearch.p.rapidapi.com';
    const String url = 'https://jsearch.p.rapidapi.com/search';

    final Map<String, String> headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': host,
    };

    final Map<String, String> params = {
      // 'query': 'Python developer in Texas, USA',
      'query': 'Developer in Croatia',
      'page': '1',
      'num_pages': '1',
    };

    final Uri uri = Uri.parse(url).replace(queryParameters: params);

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        // Uspješan odgovor
        print(json.decode(response.body));

        final Map<String, dynamic> responseData = json.decode(response.body);
        List<dynamic> data = responseData['data'];

        // Pretvaranje podataka u listu objekata klase Job
        // resultList = data.map((jobData) => Job(/* inicijalizacija atributa prema odgovoru */)).toList();
        final poseli = List.of(responseData['data']);
        for (var i = 0; i < poseli.length; i++) {
          resultList.add(Job.fromJson(poseli[i]));
        }
        inspect(resultList);
      } else {
        // Greška u zahtjevu
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Greška prilikom slanja zahtjeva
      print('Error: $error');
    }

    return resultList;
  }
}
