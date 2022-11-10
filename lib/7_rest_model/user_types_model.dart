import 'dart:convert';

class UserTypesModel {
  final String id;
  final String userId;
  final String name;

  UserTypesModel({required this.id, required this.userId, required this.name});

  factory UserTypesModel.fromMap(Map<String, dynamic> source) {
    return UserTypesModel(
      id: source['id'] ?? '',
      userId: source['userId'] ?? '',
      name: source['name'] ?? '',
    );
  }

  //2 - factory fromJson
  // Receber a string de dados, transformar em um map utilizando o jsonDecode
  // e passando por parâmetro para a função Cidade.fromMap para transformar
  // os dados em um modelo da classe
  factory UserTypesModel.fromJson(String source) => UserTypesModel.fromMap(jsonDecode(source));

//3 - Map<String,dynamic> toMap() para poder converter a classe em um map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
    };
  }

  //4 - encodar em json o map que é gerado pelo método toMap com os dados da classe
  String toJson() => jsonEncode(toMap());
}
