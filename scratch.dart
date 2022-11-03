import 'dart:io';

void main(){
  performTask();
}

void performTask() async{
  task1();
  String task2result = await task2();
  task3(task2result);
}


void task1() {
  String result = 'Task1 is data';
  print('task1 is completed');
}
Future task2() async{
  Duration fourSecond = Duration(seconds: 4);
   String? result;
  await Future.delayed(fourSecond,(){
     result = 'Task2 is data';
    print('task2 is completed');
  });
  return result;
}

void task3(String task2Data) {
  String result = 'Task3 is data';
  print('task3 is completed $task2Data');
}
