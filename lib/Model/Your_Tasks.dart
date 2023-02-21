import 'package:flutter/material.dart';

import 'Tasks.dart';

class YourTasks with ChangeNotifier{
  final List<Tasks> _tasks =[
    Tasks(title: "Nitin", description: "nitin.sharma@remotestate.com", rewardScore: 101),
    Tasks(title: "Sharma", description: "sharma@remotestate.com", rewardScore: 141),
    Tasks(title: "Akhilesh", description: "AKhilesh@remotestate.com", rewardScore: 1321),
    Tasks(title: "Baldev", description: "nitin.sharma@remotestate.com", rewardScore: 01),
    Tasks(title: "Astor", description: "Astor@remotestate.com", rewardScore: 671),
    Tasks(title: "Crusor", description: "Crusor.sharma@remotestate.com", rewardScore: 99),
    Tasks(title: "Rajeev", description: "Rajeev@remotestate.com", rewardScore: 909),
  ];

  get tasks {
    return [..._tasks];
  }
  void addTask(Tasks newTask)
  {
    _tasks.add(newTask);
    notifyListeners();
    print(tasks.length.toString());
  }
}