import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/to_do.dart';

class TaskProvider with ChangeNotifier {
  void addTask(String taskId, String title, String description,
      DateTime createdDateTime, DateTime expiredAt) async {
    FirebaseFirestore.instance
        .collection('allTasks')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('tasks')
        .doc(taskId)
        .set({
      'taskId': taskId,
      'title': title,
      'description': description,
      'createdAt': createdDateTime,
      'expiredAt': expiredAt,
    });
  }

  void editTask(String taskId, String title, String description,
      DateTime expiredAt) async {
    FirebaseFirestore.instance
        .collection('allTasks')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('tasks')
        .doc(taskId)
        .update({
      'taskId': taskId,
      'title': title,
      'description': description,
      'expiredAt': expiredAt,
    });
  }

  List<Task> tasks = [];
  void getAndSetTask() async {
    List<Task> newTasks = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('allTasks')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('tasks')
        .get();
    for (var element in querySnapshot.docs) {
      Task task = Task(
          taskId: element.get('taskId'),
          title: element.get('title'),
          description: element.get('description'),
          dateTime: element.get('dateTime'),
          expireAt: element.get('expiredAt'));
      newTasks.add(task);
    }
    tasks = newTasks;
    notifyListeners();
  }

  List<Task> get task {
    return tasks;
  }

  void deleteTask(String taskId) {
    FirebaseFirestore.instance
        .collection('allTasks')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('tasks')
        .doc(taskId)
        .delete();
  }
}
