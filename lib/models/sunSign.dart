import 'package:flutter/material.dart';

class SunSign {
  final String name;
  final String image;

  SunSign({
    required this.name,
    required this.image,
  });
}

List<SunSign> sunSignList = [
  SunSign(name: "Aries", image: "assets/images/Aries.png"),
  SunSign(name: "Taurus", image: "assets/images/Taurus.png"),
  SunSign(name: "Gemini", image: "assets/images/Gemini.png"),
  SunSign(name: "Cancer", image: "assets/images/Cancer.png"),
  SunSign(name: "Leo", image: "assets/images/Leo.png"),
  SunSign(name: "Virgo", image: "assets/images/Virgo.png"),
  SunSign(name: "Libra", image: "assets/images/Libra.png"),
  SunSign(name: "Scorpio", image: "assets/images/Scorpio.png"),
  SunSign(name: "Sagittarius", image: "assets/images/Sagittarius.png"),
  SunSign(name: "Capricorn", image: "assets/images/Capricorn.png"),
  SunSign(name: "Aquarius", image: "assets/images/Aquarius.png"),
  SunSign(name: "Pisces", image: "assets/images/Pisces.png"),
];
