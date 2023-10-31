import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { travel, leisure, food, work }

const uuid = Uuid();
const categoryIcons = {
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
};
final formatter = DateFormat.yMd();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  Expense(
      {required this.title,
      required this.amount,
      required this.category,
      required this.date})
      : id = uuid.v4();
  String get formattedDate => formatter.format(date);
}
