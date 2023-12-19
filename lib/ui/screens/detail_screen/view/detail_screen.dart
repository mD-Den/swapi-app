import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/detail_widget.dart';

class DetailScreen extends StatelessWidget {
  final String url;
  final String type;

  const DetailScreen({Key? key, required this.url, required this.type})
      : super(key: key);

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future<List<dynamic>> fetchMovies(List<String> movieUrls) async {
    List<dynamic> movies = [];
    for (var movieUrl in movieUrls) {
      final response = await http.get(Uri.parse(movieUrl));
      movies.add(json.decode(response.body));
    }
    return movies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            var mainData = snapshot.data!;
            return Column(
              children: [
                DetailWidget(type: type, data: mainData),
                Expanded(
                  child: FutureBuilder<List<dynamic>>(
                    future: fetchMovies(List<String>.from(mainData['films'])),
                    builder: (context, movieSnapshot) {
                      if (movieSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (movieSnapshot.hasError) {
                        return Center(
                            child: Text("Error: ${movieSnapshot.error}"));
                      } else if (movieSnapshot.hasData) {
                        // Здесь строим список фильмов
                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(30),
                            itemCount: movieSnapshot.data!.length,
                            itemBuilder: (context, index) {
                              var movie = movieSnapshot.data![index];
                              return ListTile(
                                title: Text(movie['title']),
                                subtitle: Text(
                                    'Director: ${movie['director']} - Producer: ${movie['producer']}'),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Text('No movie data available');
                      }
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Text('No data available');
          }
        },
      ),
    );
  }
}
