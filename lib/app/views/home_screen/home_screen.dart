// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/models/movie.dart';
import 'package:movie_app/app/shared/colors.dart';
import 'package:movie_app/app/shared/utils/movies_db.dart';
import 'package:movie_app/app/views/home_screen/movie_card.dart';
import 'package:movie_app/app/views/home_screen/widgets/custom_bottmnavbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) print("changed");
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // page header
              Text(
                "Find Movies, Tv series, and more...",
                textAlign: TextAlign.left,
                textDirection: TextDirection.ltr,
                style: Theme.of(context).textTheme.headline1,
              ),
              // search input
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 47,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF211F30),
                      border: InputBorder.none,
                      hintText: "e.g. Sherlock Holmes ...",
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFBBBBBB),
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // categories TAB BAR
              TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                isScrollable: true,
                indicatorColor: Colors.redAccent,
                tabs: [
                  _gradientText(
                    label: "Movies",
                    colors: [
                      kIconGradientSecond,
                      kIconGradientFirst,
                    ],
                    selected: true,
                  ),
                  _gradientText(
                    label: "TV series",
                    colors: [
                      kIconGradientSecond,
                      kIconGradientFirst,
                    ],
                  ),
                  _gradientText(
                    label: "Sports",
                    colors: [
                      kIconGradientSecond,
                      kIconGradientFirst,
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              // movies list
              Expanded(
                child: FutureBuilder(
                    future: MoviesDatabase.getMovies(),
                    builder: (context, AsyncSnapshot<List<Movie>> snapshots) {
                      if (snapshots.hasData) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.65,
                                  mainAxisSpacing: 15),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              MovieCard(movie: snapshots.data![index]),
                        );
                      }

                      return Center(
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator(
                            color: kIconGradientFirst,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  ShaderMask _gradientText(
      {required String label,
      required List<Color> colors,
      bool selected = false}) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: (selected) ? colors : [kTextColor, kTextColor])
            .createShader(bounds);
      },
      child: Text(
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              letterSpacing: 1.5,
            ),
        label,
      ),
    );
  }
}
