import 'package:flutter/material.dart';

class Astrology {
  final String currentDate;
  final String compatibility;
  final String luckyTime;
  final String luckyNumber;
  final String color;
  final String mood;
  final String description;

  Astrology({
    required this.currentDate,
    required this.compatibility,
    required this.luckyTime,
    required this.luckyNumber,
    required this.color,
    required this.mood,
    required this.description,
  });

  factory Astrology.fromAPI({required data}) {
    return Astrology(
      currentDate: data["current_date"],
      compatibility: data["compatibility"],
      luckyTime: data["lucky_time"],
      luckyNumber: data["lucky_number"],
      color: data["color"],
      mood: data["mood"],
      description: data["description"],
    );
  }
}

