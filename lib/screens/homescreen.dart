import 'package:flutter/material.dart';
import 'package:flutter_quadb/screens/navigation_bar.dart';
import 'package:flutter_quadb/screens/searchscreen.dart';
import 'package:flutter_quadb/utils/fetch_all_movies.dart' as moviestype;
import 'package:flutter_quadb/widgets/moviecard.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, this.selectedIndex = 0});
  int selectedIndex;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<moviestype.Show> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      final fetchedMovies = await moviestype.fetchAllMovies();
      setState(() {
        movies = fetchedMovies;
        isLoading = false;
      });
    } catch (error) {
      print("Error fetching movies: $error");
      setState(() {
        isLoading = false;
      });
    }
  }

  void updateScreen(int screenIndex) {
    setState(() {
      widget.selectedIndex = screenIndex; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movie App"),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : widget.selectedIndex == 0
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return MovieCard(
                        movie: movie,
                      );
                    },
                  )
                : const Searchscreen(),
        bottomNavigationBar: CustomNavigationBar(
          selectedIndex:
              widget.selectedIndex, // Pass selectedIndex to CustomNavigationBar
          onScreenSelected: updateScreen, // Pass the callback here
        ),
      ),
    );
  }
}
