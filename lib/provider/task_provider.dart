import 'package:flutter/material.dart';

import '../model/to_do.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get task {
    return [..._tasks];
  }
}
