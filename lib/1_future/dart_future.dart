void main() {
  print('Início do processo');
  funcao2();
  for (int i = 0; i < 10; i++) {
    print(i);
  }
  print('Fim do processo');
}

void funcao2() {
  Future.delayed(Duration(seconds: 2), () {
    print('Print funcao2 após 2 segundos');
  });
}
