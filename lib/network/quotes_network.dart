import 'dart:convert';

import '../model/quote.dart';
import 'package:http/http.dart' as http;

Future<List<Quote>> fetchQuote() async {
  final response = await http.get(Uri.parse('https://posinotes1.z13.web.core.windows.net/quotes/Test.json'));
  if (response.statusCode == 200) {
    return quoteFromJson(response.body.toString());
  } else {
    throw Exception('Failed to load Quote');
  }
}