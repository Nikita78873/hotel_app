import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget sliderwidget(List<String> pictures) {
  final CarouselController _controller = CarouselController();
  return CarouselSlider(
    items: pictures.map<Widget>((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(i),
              ),
            ),
          );
        },
      );
    }).toList(),
    options: CarouselOptions(
      enlargeCenterPage: true,
      aspectRatio: 16 / 9,
      autoPlay: true,
    ),
    carouselController: _controller,
  );
}
