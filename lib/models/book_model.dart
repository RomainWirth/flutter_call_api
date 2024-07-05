import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));
String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  final String id;
  final String name;

  Book({
    required this.id,
    required this.name,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
