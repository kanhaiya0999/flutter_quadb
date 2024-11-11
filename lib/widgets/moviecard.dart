import 'package:flutter/material.dart';
import 'package:flutter_quadb/screens/detailscreen.dart';
import 'package:flutter_quadb/utils/fetch_all_movies.dart' as moviestype;
import 'package:flutter_quadb/utils/removehtml.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final moviestype.Show movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movie: movie),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: movie.image?.medium != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        movie.image!.medium!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                  : const Placeholder(),
            ),
            const SizedBox(height: 8),
            Text(
              movie.name.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              removeHtmlTags(movie.summary.toString()),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
