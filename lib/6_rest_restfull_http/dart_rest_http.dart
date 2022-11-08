import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

main() async {
  //await buscarCep();
  //await buscarPost();
  await enviarPost();
  await atualizaPost();
}

Future<void> enviarPost() async {
  var url = 'https://my-json-server.typicode.com/typicode/demo/posts';

  var mapaRequest = {
    'id': 4,
    'title': 'Post3',
  };

  var response = await http.post(Uri.parse(url), body: json.encode(mapaRequest));
  print(response.statusCode);
}

Future<void> atualizaPost() async {
  var url = 'https://my-json-server.typicode.com/typicode/demo/posts/3';

  var mapaRequest = {
    'id': 3,
    'title': 'Post3Alterado',
  };

  var response = await http.put(Uri.parse(url), body: json.encode(mapaRequest));
  print(response.statusCode);
}

Future<void> buscarPost() async {
  String url = 'https://my-json-server.typicode.com/typicode/demo/posts';
  var response = await http.get(Uri.parse(url));

  var responseData = jsonDecode(response.body);
  if (response.statusCode >= 200 && response.statusCode < 300) {
    if (responseData is List) {
      responseData.forEach((element) {
        print('Id: ${element['id']} Title: ${element['title']}');
      });
    }
  }
}

Future<void> buscarCep() async {
  String url = 'https://viacep.com.br/ws/01001000/json/';
  var response = await http.get(Uri.parse(url));

  if (response.statusCode >= 200 && response.statusCode < 300) {
    Map<String, dynamic> responseData = jsonDecode(response.body);
    //print(responseData);
    responseData.forEach((key, value) {
      print('$key : $value');
    });
  }
}
