import 'dart:convert';

Movie moviesFromJson(String str) => Movie.fromJson(json.decode(str));

String moviesToJson(Movie data) => json.encode(data.toJson());

class Movie {
  final String id;
  final String name;
  final int runtimeInMinutes;
  final int budgetInMillions;
  final double boxOfficeRevenueInMillions;
  final int academyAwardNominations;
  final int academyAwardWins;
  final double rottenTomatoesScore;

  Movie({
    required this.id,
    required this.name,
    required this.runtimeInMinutes,
    required this.budgetInMillions,
    required this.boxOfficeRevenueInMillions,
    required this.academyAwardNominations,
    required this.academyAwardWins,
    required this.rottenTomatoesScore,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["_id"],
    name: json["name"],
    runtimeInMinutes: json["runtimeInMinutes"],
    budgetInMillions: json["budgetInMillions"],
    boxOfficeRevenueInMillions: json["boxOfficeRevenueInMillions"]?.toDouble(),
    academyAwardNominations: json["academyAwardNominations"],
    academyAwardWins: json["academyAwardWins"],
    rottenTomatoesScore: json["rottenTomatoesScore"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "runtimeInMinutes": runtimeInMinutes,
    "budgetInMillions": budgetInMillions,
    "boxOfficeRevenueInMillions": boxOfficeRevenueInMillions,
    "academyAwardNominations": academyAwardNominations,
    "academyAwardWins": academyAwardWins,
    "rottenTomatoesScore": rottenTomatoesScore,
  };
}