import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exercise_api/services/api_service.dart';
import 'package:flutter_exercise_api/models/book_model.dart';

class BooksWidget extends StatelessWidget {
  const BooksWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<Book>>(
          future: ApiService().fetchBooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data! == {}) {
              return const Center(child: Text('No books found'));
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.menu_book_outlined),
                  title: Text(snapshot.data![index].name),
                );
              }
            );
          }
        ),
      ],
    );
  }
}