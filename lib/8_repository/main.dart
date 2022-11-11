import 'package:dart_async/8_repository/models/cidade_model.dart';
import 'package:dart_async/8_repository/repositories/cidade_repository.dart';

Future<void> main() async {
  CidadeRepository repository = CidadeRepository();
  try {
    Cidade cidade = await repository.buscarCidade();
    print(cidade);
  } catch (e) {
    print('Erro encontrado: $e');
  }
}
