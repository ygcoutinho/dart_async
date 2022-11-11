import 'dart:convert';

class Cidade {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String ddd;

  Cidade({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  //4 métodos para trabalhar com o json

  //1 - factory fromMap
  // Transformar o map recebido no modelo da classe
  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      ddd: map['ddd'] ?? '',
    );
  }

  //2 - factory fromJson
  // Receber a string de dados, transformar em um map utilizando o jsonDecode
  // e passando por parâmetro para a função Cidade.fromMap para transformar
  // os dados em um modelo da classe
  factory Cidade.fromJson(String source) => Cidade.fromMap(jsonDecode(source));

  //3 - Map<String,dynamic> toMap() para poder converter a classe em um map
  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ddd': ddd,
    };
  }

  //4 - encodar em json o map que é gerado pelo método toMap com os dados da classe
  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return '''
        Informações do endereço:
          Cep: $cep,
          Logradouro: $logradouro,
          Complemento: $complemento,
          Bairro: $bairro;
          Localidade: $localidade,
          UF: $uf,
          DDD: $ddd
    ''';
  }
}
