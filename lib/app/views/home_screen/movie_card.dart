import 'package:flutter/material.dart';
import 'package:movie_app/app/models/movie.dart';
import 'package:movie_app/app/views/movies_screen/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => MovieDetails(
              movie: movie,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(movie.imageURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            movie.title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
