import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;
import '../Components/search.dart';

Future<List> fetchNews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=6bfec4bd9236418c8413844b3f9baf00&q=' +
            Search.searchController.text),
  );
  Map result = jsonDecode(response.body);
  if (kDebugMode) {
    print('Fetched');
  }
  // if (kDebugMode) {
  //   print(response.body.toString());
  // }
  // if (kDebugMode) {
  //   print(result.length);
  //}
  return (result['articles']);
}
