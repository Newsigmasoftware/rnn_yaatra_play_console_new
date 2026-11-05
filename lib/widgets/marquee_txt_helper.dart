// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// /// A simple reusable marquee (scrolling) text widget using carousel_slider.
// /// Automatically loops through text items like a marquee effect.
// class MarqueeText extends StatelessWidget {
//   final List<String> texts;
//   final TextStyle? style;
//   final double height;
//   final Duration scrollDuration;
//   final Duration pauseDuration;
//   final Axis scrollDirection;

//   const MarqueeText({
//     Key? key,
//     required this.texts,
//     this.style,
//     this.height = 30.0,
//     this.scrollDuration = const Duration(seconds: 5),
//     this.pauseDuration = const Duration(seconds: 1),
//     this.scrollDirection = Axis.horizontal,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: height,
//         autoPlay: true,
//         scrollDirection: scrollDirection,
//         autoPlayInterval: scrollDuration,
//         autoPlayAnimationDuration: const Duration(milliseconds: 800),
//         pauseAutoPlayOnTouch: true,
//         viewportFraction: 1.0,
//         enlargeCenterPage: false,
//         autoPlayCurve: Curves.linear,
//       ),
//       items: texts.map((text) {
//         return Align(
//           alignment: Alignment.centerLeft,
//           child: Text(
//             text,
//             style: style ??
//                 const TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.w500,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//             maxLines: 1,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
