Future<void> main() async {
  List<String> nomes = ['Yago', 'Jéssica', 'Cida', 'Sueli', 'Dalvino'];

  // Irá esperar a execução
  print('#### Início bloco 1');
  await Future.forEach(nomes, (nome) async {
    print(await saudacao(nome));
  });
  print('#### Fim bloco 1');

  //Também irá esperar a execução
  print('#### Início bloco 2');
  for (String nome in nomes) {
    print(await saudacao(nome));
  }
  print('#### Fim bloco 2');

  //O map irá executar as todas as chamadas de uma vez para cada elemento da lista,
  //reduzindo o tempo do future.delayed
  //Na lista acima, são 5 elementos que demoraria 5 segundos, com o map, o tempo cai para 1 segundo
  print('#### Início bloco 3');
  List<Future<String>> nomesFuturo = nomes.map((nome) => saudacao(nome)).toList();
  List<String> saudacoes = await Future.wait(nomesFuturo);
  print(saudacoes);
  print('#### Fim bloco 3');
}

Future<String> saudacao(String nome) {
  print('Chamado $nome');
  return Future.delayed(Duration(seconds: 1), () => 'Olá $nome');
}
