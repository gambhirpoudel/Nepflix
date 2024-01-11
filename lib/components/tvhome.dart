import 'package:flutter/material.dart';
import 'package:nepflix/components/airingtoday.dart';
import 'package:nepflix/components/appbar.dart';
import 'package:nepflix/components/ontheair.dart';
import 'package:nepflix/components/topratedtv.dart';
import 'package:nepflix/components/tv.dart';

import 'package:tmdb_api/tmdb_api.dart';

class TvHome extends StatefulWidget {
  const TvHome({super.key});

  @override
  State<TvHome> createState() => _TvHomeState();
}

class _TvHomeState extends State<TvHome> {
  List tv = [];
  List topratedtvs = [];
  List ontheair = [];
  List airingtoday = [];
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

    Map tvresults = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map topratedtvresults = await tmdbWithCustomLogs.v3.tv.getTopRated();
    Map ontheairresults = await tmdbWithCustomLogs.v3.tv.getOnTheAir();
    Map airingtodayresults = await tmdbWithCustomLogs.v3.tv.getAiringToday();

    setState(() {
      tv = tvresults['results'];
      topratedtvs = topratedtvresults['results'];
      ontheair = ontheairresults['results'];
      airingtoday = airingtodayresults['results'];
      // print(tv);
    });
    // print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'TV Shows'),
      body: ListView(
        children: [
          AiringToday(airingtoday: airingtoday),
          OnTheAir(ontheair: ontheair),
          TopRateTV(topratedtv: topratedtvs),
          PopularTV(tv: tv),
        ],
      ),
    );
  }
}
