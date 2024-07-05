import 'dart:convert';
import 'package:flutter_exercise_api/models/book_model.dart';
import 'package:flutter_exercise_api/models/movie_model.dart';
import 'package:http/http.dart' as http;

const token = 'RxpVMbQbENRR667Qpogr';
const headers = {
  'content-type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer $token',
};

class ApiService {
  Future<List<Book>> fetchBooks() async {
    final response = await http.get(
      Uri.parse('https://the-one-api.dev/v2/book'),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)["docs"];
      List<Book> books = jsonResponse.map((dynamic item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<List<Book>> fetchBook($id) async {
    final response = await http.get(
      Uri.parse('https://the-one-api.dev/v2/book/', $id)
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)["docs"];
      List<Book> books = jsonResponse.map((dynamic item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception('Failed to load articles');
    }
  }

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(
      Uri.parse(
        'https://the-one-api.dev/v2/movie',
        headers as int,
      )
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)["docs"];
      List<Movie> movies = jsonResponse.map((dynamic item) => Movie.fromJson(item)).toList();
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}