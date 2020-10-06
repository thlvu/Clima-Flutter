import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'Task 1 result';
  print(result);
}

Future<String> task2() async {
  Duration duration = Duration(seconds: 3);

  String result;
  await Future.delayed(duration, () {
    result = 'Task 2 result';
    print(result);
  });

  return result;
}

void task3(String otherResult) {
  String result = 'Task 3 result';
  print('$result $otherResult');
}