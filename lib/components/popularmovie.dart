import 'package:flutter/material.dart';
import 'package:nepflix/components/credit.dart';
import 'package:nepflix/utils/fonts.dart';

class PopularMovies extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final popular;
  // ignore: prefer_typing_uninitialized_variables
  final credit;
  // ignore: use_key_in_widget_constructors
  const PopularMovies({Key? key, this.popular, this.credit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: 'Popular Movies', size: 24, color: Colors.white),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: popular.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Creditdetails(
                          name:
                              popular[index]['title'] ?? popular[index]['name'],
                          tvId: 0,
                          movieId: popular[index]['id'],
                          bannerurl:
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500' +
                                  popular[index]['backdrop_path'],
                          posterurl:
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500' +
                                  popular[index]['poster_path'],
                          description: popular[index]['overview'],
                          vote: popular[index]['vote_average'].toString(),
                          launchon: popular[index]['first_air_date'] ??
                              popular[index]['release_date'].toString(),
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
                                    popular[index]['backdrop_path'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ModifiedText(
                            text: popular[index]['title'] ??
                                popular[index]['name'],
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
