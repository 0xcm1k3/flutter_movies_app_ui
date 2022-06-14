import 'package:flutter/material.dart';
import 'package:movie_app/app/models/movie.dart';
import 'package:movie_app/app/shared/colors.dart';
import 'package:movie_app/app/views/movies_screen/widgets/expandable_text.dart';
import 'package:movie_app/app/views/movies_screen/widgets/relatedMovies_card.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.overlay),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              movie.imageURL,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: ShaderMask(
                          shaderCallback: (rect) => LinearGradient(
                            colors: [
                              kIconGradientSecond,
                              kIconGradientFirst,
                            ],
                          ).createShader(rect),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.3),
                                  blurRadius: 10,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.play_circle_rounded,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.height * 0.03,
                      child: InkWell(
                        onTap: () {
                          Navigator.maybePop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_sharp,
                                  color: kIconColor,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "150 minutes",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: kIconColor,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: kIconColor,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "5.3 (IMDb)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: kIconColor,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: kIconColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: "Release Date",
                                style: Theme.of(context).textTheme.bodyText1,
                                children: [
                                  const TextSpan(text: "\n"),
                                  TextSpan(
                                    text: movie.releaseDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                          fontSize: 12,
                                          color: kDetailsTextColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Genre",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Wrap(
                                  runSpacing: 5,
                                  children: [
                                    ...List.generate(
                                      movie.genres.length,
                                      (index) => Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFAF0CA)
                                                .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(-1, -1),
                                                  blurStyle: BlurStyle.inner,
                                                  blurRadius: 50,
                                                  color: Colors.grey
                                                      .withOpacity(0.2))
                                            ]),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 9),
                                        alignment: Alignment.center,
                                        width: 90,
                                        child: Text(
                                          movie.genres[index],
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(
                                                fontSize: 16,
                                                color: kIconColor,
                                              ),
                                        ),
                                      ),
                                    ).toList()
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: kIconColor,
                      ),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      ExpandableText(
                        text: movie.overview,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Related Movies",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                          future: movie.getRelated(),
                          builder:
                              (context, AsyncSnapshot<List<Movie>> snapshot) {
                            if (snapshot.hasData) {
                              return NotificationListener<
                                  OverscrollIndicatorNotification>(
                                onNotification: (scroll) {
                                  scroll.disallowIndicator();
                                  return true;
                                },
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  clipBehavior: Clip.none,
                                  physics: const BouncingScrollPhysics(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ...List.generate(
                                        8,
                                        (index) => RelatedMoviesCard(
                                          movie: snapshot.data![index],
                                        ),
                                      ).toList()
                                    ],
                                  ),
                                ),
                              );
                            }
                            return Text(
                              "None",
                              style: Theme.of(context).textTheme.bodyText1,
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
