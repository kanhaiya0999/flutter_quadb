import 'package:flutter/material.dart';
import 'package:flutter_quadb/screens/homescreen.dart';
import 'package:flutter_quadb/utils/fetch_all_movies.dart' as moviestype;
import 'package:flutter_quadb/utils/removehtml.dart';

class DetailsScreen extends StatelessWidget {
  final moviestype.Show movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.name.toString()),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    selectedIndex: 1,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Movie Image with a rounded border
              movie.image?.medium != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        movie.image!.medium!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                  : const Placeholder(),
              const SizedBox(height: 16),
              // Movie name as the main title
              Text(
                movie.name.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 8),
              // Movie summary
              Text(
                removeHtmlTags(movie.summary.toString()),
              ),
              const SizedBox(height: 16),

              // Display movie details in a card-like layout
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (movie.genres != null && movie.genres!.isNotEmpty)
                        _buildDetailRow(
                          icon: Icons.category,
                          text: "Genres: ${movie.genres!.join(', ')}",
                        ),
                      if (movie.language != null)
                        _buildDetailRow(
                          icon: Icons.language,
                          text: "Language: ${movie.language}",
                        ),
                      if (movie.status != null)
                        _buildDetailRow(
                          icon: Icons.info,
                          text: "Status: ${movie.status}",
                        ),
                      if (movie.runtime != null)
                        _buildDetailRow(
                          icon: Icons.access_time,
                          text: "Runtime: ${movie.runtime} minutes",
                        ),
                      if (movie.premiered != null)
                        _buildDetailRow(
                          icon: Icons.calendar_today,
                          text: "Premiered: ${movie.premiered}",
                        ),
                      if (movie.ended != null)
                        _buildDetailRow(
                          icon: Icons.stop,
                          text: "Ended On: ${movie.ended}",
                        ),
                      if (movie.schedule != null &&
                          movie.schedule!.time != null &&
                          movie.schedule!.time!.isNotEmpty)
                        _buildDetailRow(
                          icon: Icons.stop,
                          text:
                              "Show Timing: ${movie.schedule!.time} on every ${movie.schedule!.days!.join(",")}",
                        ),
                      if (movie.rating != null)
                        _buildDetailRow(
                          icon: Icons.star,
                          text: "Rating: ${movie.rating?.average ?? 'N/A'}",
                        ),
                      if (movie.network != null)
                        _buildDetailRow(
                          icon: Icons.tv,
                          text: "Network: ${movie.network?.name ?? 'N/A'}",
                        ),
                      if (movie.officialSite != null)
                        _buildDetailRow(
                          icon: Icons.link,
                          text: "Official Site: ${movie.officialSite}",
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A reusable widget for each detail row
  Widget _buildDetailRow({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
