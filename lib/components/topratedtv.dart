import 'package:flutter/material.dart';
import 'package:nepflix/utils/fonts.dart';
import 'package:nepflix/components/description.dart';

class TopRatedTV extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final topratedtv;
  const TopRatedTV({super.key, this.topratedtv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: 'Top Rated TV Shows', size: 24, color: Colors.white),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: topratedtv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: topratedtv[index]['title'] ??
                                        topratedtv[index]['name'],
                                    bannerurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            topratedtv[index]['backdrop_path'],
                                    posterurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            topratedtv[index]['poster_path'],
                                    description: topratedtv[index]['overview'],
                                    vote: topratedtv[index]['vote_average']
                                        .toString(),
                                    launchon: topratedtv[index]
                                            ['first_air_date'] ??
                                        topratedtv[index]['release_date']
                                            .toString(),
                                  )));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            topratedtv[index]['backdrop_path']),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            child: ModifiedText(
                                text: topratedtv[index]['title'] ??
                                    topratedtv[index]['name'],
                                size: 15,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
