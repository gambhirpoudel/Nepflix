import 'package:flutter/material.dart';
import 'package:nepflix/components/description.dart';
import 'package:tmdb_api/tmdb_api.dart'; // Import the necessary TMDB package

class Creditdetails extends StatefulWidget {
  final int movieId;
  final int tvId;
  // ignore: prefer_typing_uninitialized_variables
  final bannerurl;
  // ignore: prefer_typing_uninitialized_variables
  final posterurl;
  // ignore: prefer_typing_uninitialized_variables
  final description;
  // ignore: prefer_typing_uninitialized_variables
  final vote;
  final String name;
  // ignore: prefer_typing_uninitialized_variables
  final launchon;

  const Creditdetails({
    Key? key,
    required this.movieId,
    required this.bannerurl,
    required this.posterurl,
    required this.description,
    required this.vote,
    required this.launchon,
    required this.tvId,
    required this.name,
  }) : super(key: key);

  @override
  State<Creditdetails> createState() => _CreditdetailsState();
}

class _CreditdetailsState extends State<Creditdetails> {
  List creditmovie = [];
  List credittv = [];
  final String apikey = 'd9e063e604b5c938e70876c537f01c20';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOWUwNjNlNjA0YjVjOTM4ZTcwODc2YzUzN2YwMWMyMCIsInN1YiI6IjY1OTM5MDU0NjUxZmNmNWViYThmYjFjZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.dvYTroDlmHiRcMd8kDpi5pBg7rCWW4P0EwrI0gOUPgw';

  @override
  void initState() {
    super.initState();
    loadcredits();
  }

  Future<void> loadcredits() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    if (widget.movieId != 0) {
      Map creditresults =
          await tmdbWithCustomLogs.v3.movies.getCredits(widget.movieId);
      setState(() {
        creditmovie = creditresults['cast'];
      });
    }

    if (widget.tvId != 0) {
      Map credittvresults =
          await tmdbWithCustomLogs.v3.tv.getCredits(widget.tvId);
      setState(() {
        credittv = credittvresults['cast'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> castImages = [];
    List<String> character = [];
    if (widget.movieId != 0 && creditmovie.isNotEmpty) {
      castImages = creditmovie.map((cast) {
        character.add(cast['character']);

        return cast['profile_path'] != null
            ? 'https://image.tmdb.org/t/p/w500${cast['profile_path']}'
            : 'https://cdn.discordapp.com/attachments/1036120891857305661/1194625482486988810/placeholder.jpg';
      }).toList();
    } else if (widget.tvId != 0 && credittv.isNotEmpty) {
      castImages = credittv.map((cast) {
        character.add(cast['character']);
        return cast['profile_path'] != null
            ? 'https://image.tmdb.org/t/p/w500${cast['profile_path']}'
            : 'https://cdn.discordapp.com/attachments/1036120891857305661/1194625482486988810/placeholder.jpg';
      }).toList();
    }

    return Description(
      name: widget.name,
      movieId: widget.movieId,
      bannerurl: widget.bannerurl,
      posterurl: widget.posterurl,
      description: widget.description,
      vote: widget.vote,
      castImages: castImages,
      launchon: widget.launchon,
      character: character,
    );
  }
}
