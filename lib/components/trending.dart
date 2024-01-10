import 'package:flutter/material.dart';
import 'package:nepflix/components/credit.dart';
import 'package:nepflix/utils/fonts.dart';

class TrendingMovies extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final trending;
  // ignore: prefer_typing_uninitialized_variables
  final credit;
  // ignore: use_key_in_widget_constructors
  const TrendingMovies({Key? key, this.trending, this.credit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: 'Trending Movies', size: 24, color: Colors.white),
          SizedBox(
            height: 195,
            child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Creditdetails(
                          name: trending[index]['title'] ??
                              trending[index]['name'],
                          movieId: trending[index]['id'],
                          bannerurl:
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['backdrop_path'],
                          posterurl:
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['poster_path'],
                          description: trending[index]['overview'],
                          vote: trending[index]['vote_average'].toString(),
                          launchon: trending[index]['first_air_date'] ??
                              trending[index]['release_date'].toString(),
                          tvId: 0,
                        ),
                      ),
                    );
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
                                    trending[index]['backdrop_path'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ModifiedText(
                            text: trending[index]['title'] ??
                                trending[index]['name'],
                            size: 15,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
