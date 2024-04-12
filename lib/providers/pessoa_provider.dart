import 'package:flutter/foundation.dart';
import 'package:mycontacts/entities/pessoa.dart';
import 'package:mycontacts/use_cases/pessoa_use_case.dart';

class PessoaProvider with ChangeNotifier {
  final PessoaUseCase useCase;

  PessoaProvider({required this.useCase});

  List<Pessoa> pessoas = [];

  Future<void> fetchPessoas() async {
    pessoas = await useCase.getPessoas();
    notifyListeners();
  }

  Future<void> addPessoa(Pessoa pessoa) async {
    await useCase.addPessoa(pessoa);
    fetchPessoas();
  }

  Future<void> removePessoa(Pessoa pessoa) async {
    await useCase.removePessoa(pessoa);
    fetchPessoas();
  }
}
