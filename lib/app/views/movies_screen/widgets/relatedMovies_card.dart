import 'package:flutter/material.dart';
import 'package:movie_app/app/models/movie.dart';
import 'package:movie_app/app/views/movies_screen/movie_details_screen.dart';

class RelatedMoviesCard extends StatelessWidget {
  final Movie movie;
  const RelatedMoviesCard({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => MovieDetails(movie: movie)));
      },
      child: Container(
        height: 150,
        width: 130,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: NetworkImage(movie.imageURL),
                    fit: BoxFit.fill,
                  ),
                ),
                width: 150,
                height: 150,
              ),
            ),
            Text(
              movie.title,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 16,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
