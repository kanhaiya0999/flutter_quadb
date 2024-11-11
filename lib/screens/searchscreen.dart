import 'package:flutter/material.dart';
import 'package:flutter_quadb/utils/fetch_all_movies.dart' as moviestype;
import 'package:flutter_quadb/widgets/moviecard.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  TextEditingController searchController = TextEditingController();
  List<moviestype.Show> searchResults = [];
  bool isLoading = false;
  String keyword = '';
  late String previousKeyword;
  late Future<void> searchFuture;

  @override
  void initState() {
    super.initState();
    previousKeyword = '';
  }

  Future<void> searchMovies(String keyword) async {
    if (keyword.isEmpty) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final fetchedMovies = await moviestype.searchMovie(keyword);
      setState(() {
        searchResults = fetchedMovies;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void debounceSearch(String keyword) {
    if (keyword != previousKeyword) {
      previousKeyword = keyword;
      searchFuture = Future.delayed(const Duration(milliseconds: 500), () {
        searchMovies(keyword);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for movies...',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  keyword = value;
                });
                debounceSearch(value);
              },
            ),
            const SizedBox(height: 10),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final movie = searchResults[index];
                        return MovieCard(
                          movie: movie,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
