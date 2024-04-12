import 'package:mycontacts/entities/pessoa.dart';
import 'package:mycontacts/repositories/pessoa_repository.dart';

class PessoaUseCase {
  final PessoaRepository repository;

  PessoaUseCase({required this.repository});

  Future<int> addPessoa(Pessoa pessoa) async {
    return repository.insertPessoa(pessoa);
  }

  Future<List<Pessoa>> getPessoas() async {
    return repository.retrievePessoas();
  }

  Future<void> removePessoa(Pessoa pessoa) async {
    await repository.deletePessoa(pessoa);
  }
}
