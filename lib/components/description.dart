import 'package:flutter/material.dart';
import 'package:nepflix/components/appbar.dart';
import 'package:nepflix/utils/fonts.dart';

class Description extends StatelessWidget {
  final String name, description, posterurl, vote, bannerurl, launchon;
  final List<String> castImages, character;

  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.posterurl,
    required this.vote,
    required this.bannerurl,
    required this.launchon,
    required this.castImages,
    required this.character,
    movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Details'),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            children: [
              SizedBox(
                height: 250,
                child: Stack(
                  children: [
                    Positioned(
                        child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          bannerurl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                    Positioned(
                      bottom: 10,
                      child: ModifiedText(
                        text: '⭐ Average Rating - $vote',
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(10),
                child: ModifiedText(text: name, size: 25, color: Colors.white),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: ModifiedText(
                  text: 'Released On - $launchon',
                  size: 15,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 200,
                    width: 100,
                    child: Image.network(posterurl),
                  ),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: ModifiedText(
                        text: description,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: castImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String imageURL = castImages[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(imageURL),
                          ),
                          SizedBox(
                            height: 100,
                            child: Text(
                              character[index],
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
