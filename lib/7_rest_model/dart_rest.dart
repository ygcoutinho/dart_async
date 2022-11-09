import 'package:dart_async/7_rest_model/cidade_model.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  String url = 'https://viacep.com.br/ws/01001000/json/';
  http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print('Dados recuperados');
    Cidade cidade = Cidade.fromJson(response.body);
    print(cidade);
  } else {
    print('Ocorreu algo errado: ${response.statusCode}');
  }
}
