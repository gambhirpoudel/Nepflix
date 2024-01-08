import 'package:flutter/material.dart';
import 'package:nepflix/utils/fonts.dart';
import 'package:nepflix/components/description.dart';

class TopRatedMovies extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final toprated;
  // ignore: prefer_typing_uninitialized_variables
  final credit;
  const TopRatedMovies({super.key, this.toprated, this.credit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: 'Top Rated Movies', size: 24, color: Colors.white),
          SizedBox(
            height: 200,
            child: ListView.builder(
                itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: toprated[index]['title'] ??
                                        toprated[index]['name'],
                                    bannerurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['backdrop_path'],
                                    posterurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path'],
                                    description: toprated[index]['overview'],
                                    vote: toprated[index]['vote_average']
                                        .toString(),
                                    creditBannerurl:
                                        // ignore: prefer_interpolation_to_compose_strings
                                        'https://image.tmdb.org/t/p/w500/' +
                                            credit[index]['profile_path'],
                                    launchon: toprated[index]
                                            ['first_air_date'] ??
                                        toprated[index]['release_date']
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
                                            toprated[index]['backdrop_path']),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            child: ModifiedText(
                                text: toprated[index]['title'] ??
                                    toprated[index]['name'],
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
