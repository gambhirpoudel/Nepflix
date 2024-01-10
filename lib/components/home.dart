import 'package:flutter/material.dart';
import 'package:nepflix/components/appbar.dart';
import 'package:nepflix/components/toprated.dart';
import 'package:nepflix/components/topratedtv.dart';
import 'package:nepflix/components/trending.dart';
import 'package:nepflix/components/tv.dart';
import 'package:nepflix/components/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List upcomingmovies = [];
  List tv = [];
  List creditmovie = [];
  List credittv = [];
  List topratedtvs = [];
  final String apikey = 'd9e063e604b5c938e70876c537f01c20';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOWUwNjNlNjA0YjVjOTM4ZTcwODc2YzUzN2YwMWMyMCIsInN1YiI6IjY1OTM5MDU0NjUxZmNmNWViYThmYjFjZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dvYTroDlmHiRcMd8kDpi5pBg7rCWW4P0EwrI0gOUPgw';
  // int tvId = 4614;

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map upcomingresults = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPopular();
    // int movieId = 753342;
    // Map moviecredit = await tmdbWithCustomLogs.v3.movies.getCredits(movieId);
    // print(moviecredit);
    Map topratedtvresults = await tmdbWithCustomLogs.v3.tv.getTopRated();

    setState(() {
      trendingmovies = trendingresults['results'];
      topratedmovies = topratedresults['results'];
      upcomingmovies = upcomingresults['results'];
      tv = tvresults['results'];
      topratedtvs = topratedtvresults['results'];
      // print(tv);
    });
    // print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'NepFlix'),
        body: ListView(
          children: [
            TrendingMovies(
              trending: trendingmovies,
            ),
            TopRateMovies(
              toprated: topratedmovies,
            ),
            PopularTV(
              tv: tv,
            ),
            TopRateTV(
              topratedtv: topratedtvs,
            ),
            Upcoming(
              upcoming: upcomingmovies,
            ),
          ],
        ));
  }
}
