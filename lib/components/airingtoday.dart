import 'package:flutter/material.dart';
import 'package:nepflix/components/credit.dart';
import 'package:nepflix/utils/fonts.dart';

class AiringToday extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final airingtoday;
  // ignore: prefer_typing_uninitialized_variables
  final credit;
  // ignore: use_key_in_widget_constructors
  const AiringToday({Key? key, this.airingtoday, this.credit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: 'Airing Today', size: 24, color: Colors.white),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: airingtoday.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Creditdetails(
                          tvId: airingtoday[index]['id'],
                          name: airingtoday[index]["title"] ??
                              airingtoday[index]['name'],
                          movieId: 0,
                          bannerurl:
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500' +
                                  airingtoday[index]['backdrop_path'],
                          posterurl:
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500' +
                                  airingtoday[index]['poster_path'],
                          description: airingtoday[index]['overview'],
                          vote: airingtoday[index]['vote_average'].toString(),
                          launchon: airingtoday[index]['first_air_date'] ??
                              airingtoday[index]['release_date'].toString(),
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
                                    airingtoday[index]['backdrop_path'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ModifiedText(
                            text: airingtoday[index]['title'] ??
                                airingtoday[index]['name'],
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
