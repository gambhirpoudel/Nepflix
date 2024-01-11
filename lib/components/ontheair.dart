import 'package:flutter/material.dart';
import 'package:nepflix/components/credit.dart';
import 'package:nepflix/utils/fonts.dart';

class OnTheAir extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final ontheair;
  // ignore: prefer_typing_uninitialized_variables
  final credit;
  // ignore: use_key_in_widget_constructors
  const OnTheAir({Key? key, this.ontheair, this.credit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: 'On The Air', size: 24, color: Colors.white),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: ontheair.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Creditdetails(
                          tvId: ontheair[index]['id'],
                          name: ontheair[index]["title"] ??
                              ontheair[index]['name'],
                          movieId: 0,
                          bannerurl:
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500' +
                                  ontheair[index]['backdrop_path'],
                          posterurl:
                              // ignore: prefer_interpolation_to_compose_strings
                              'https://image.tmdb.org/t/p/w500' +
                                  ontheair[index]['poster_path'],
                          description: ontheair[index]['overview'],
                          vote: ontheair[index]['vote_average'].toString(),
                          launchon: ontheair[index]['first_air_date'] ??
                              ontheair[index]['release_date'].toString(),
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
                                    ontheair[index]['backdrop_path'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: ModifiedText(
                            text: ontheair[index]['title'] ??
                                ontheair[index]['name'],
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
