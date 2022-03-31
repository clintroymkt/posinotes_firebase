// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Quote> quoteFromJson(String str) => List<Quote>.from(json.decode(str).map((x) => Quote.fromJson(x)));

String quoteToJson(List<Quote> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quote {
    Quote({
        required this.quoteNumber,
        required this.quote,
        required this.author,
    });

    String quoteNumber;
    String quote;
    String author;

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        quoteNumber: json["quoteNumber"],
        quote: json["quote"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        "quoteNumber": quoteNumber,
        "quote": quote,
        "author": author,
    };
}