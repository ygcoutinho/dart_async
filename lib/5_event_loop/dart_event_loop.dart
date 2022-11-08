import 'dart:async';

void main() {
  print('Início do main');
  scheduleMicrotask((() => print('Microtask #1')));
  // print(DateTime.now());
  Future.delayed(Duration(seconds: 1), () {
    // print(DateTime.now());
    print('Future #1 delayed');
  });
  Future(() => print('Future #2'));
  Future(() => print('Future #3'));
  scheduleMicrotask((() => print('Microtask #2')));
  print('Fim Main');
}
