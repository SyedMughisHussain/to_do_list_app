// import 'package:intl/intl.dart';

class Task {
  final String taskId;
  final String title;
  final String description;
  final DateTime dateTime;
  final DateTime expireAt;

  Task(
      {required this.taskId,
      required this.title,
      required this.description,
      required this.dateTime,
      required this.expireAt});
}
