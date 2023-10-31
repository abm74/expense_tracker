import 'package:uuid/uuid.dart';

enum Category { travel, leisure, food, work }

const uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;
  Expense(
      {required this.title,
      required this.amount,
      required this.category,
      required this.dateTime})
      : id = uuid.v4();
}
