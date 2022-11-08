void main() {
  // 2 status - Incompleto, Concluído (com valor, com erro)

  //Concluído com valor
  p1().then((mensagem) => print(mensagem));

  //Concluído com erro utilizando o catchError
  p2().then((mensagem) => print(mensagem)).catchError((error) => print('Erro ao executar o processo 2'));

  //Concluído com erro utilizando o onError
  p2().then((mensagem) => print(mensagem), onError: (error) => print('Erro ao executar o processo 2'));
}

Future<String> p1() {
  print('Processo 1 sem erros');
  return Future.delayed(Duration(seconds: 2), () => 'Teste');
}

Future<String> p2() {
  return Future.delayed(Duration(seconds: 4), () => throw Exception());
}
