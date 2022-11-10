import 'dart:convert';

import 'package:dart_async/7_rest_model/user_types_model.dart';

class UserModel {
  final String id;
  final String name;
  final String userName;
  final List<UserTypesModel> userTypes;
  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.userTypes,
  });

  //1 - factory fromMap
  // Transformar o map recebido no modelo da classe
  factory UserModel.fromMap(Map<String, dynamic> source) {
    return UserModel(
      id: source['id'] ?? '',
      name: source['name'] ?? '',
      userName: source['username'],
      userTypes: source['user_types']?.map((type) {
            return UserTypesModel.fromMap(type);
          }).toList() ??
          [],
    );
  }

  //2 - factory fromJson
  // Receber a string de dados, transformar em um map utilizando o jsonDecode
  // e passando por parâmetro para a função Cidade.fromMap para transformar
  // os dados em um modelo da classe
  factory UserModel.fromJson(source) => UserModel.fromMap(jsonDecode(source));

//3 - Map<String,dynamic> toMap() para poder converter a classe em um map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': userName,
      'user_types': userTypes.map((e) => e.toMap()).toList(),
    };
  }

  //4 - encodar em json o map que é gerado pelo método toMap com os dados da classe
  String toJson() => jsonEncode(toMap());
}
