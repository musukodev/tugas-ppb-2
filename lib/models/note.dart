import 'package:flutter/material.dart';

class Note {
  Note({
    required this.title,
    required this.body,
    required this.category,
    required this.date,
    required this.color,
    required this.priority,
  });

  String title;
  String body;
  String category;
  String date;
  Color color;
  String priority;
}
