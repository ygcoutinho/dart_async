Future<void> main() async {
  try {
    String mensagem = await p1();
    print(mensagem);
    String mensagem2 = await p2();
    print(mensagem2);
    String mensagem3 = await p3();
    print(mensagem3);
  } on Exception catch (error) {
    print('Erro na chamada do processo, $error');
  }
}

Future<String> p1() {
  print('Início do processo 1');
  return Future.delayed(Duration(seconds: 2), () => 'Processo 1 concluído');
}

Future<String> p2() {
  print('Início do processo 2');
  return Future.delayed(Duration(seconds: 3), () => 'Processo 2 concluído');
}

Future<String> p3() {
  print('Início do processo 3');
  return Future.delayed(Duration(seconds: 2), () => throw Exception());
}
