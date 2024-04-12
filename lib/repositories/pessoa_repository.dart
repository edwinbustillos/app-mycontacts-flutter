import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mycontacts/entities/pessoa.dart';

class PessoaRepository {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'pessoas.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE pessoas(nome TEXT, telefone TEXT, fotoPath TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertPessoa(Pessoa pessoa) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('pessoas', pessoa.toMap());
    return result;
  }

  Future<List<Pessoa>> retrievePessoas() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('pessoas');
    return queryResult.map(Pessoa.fromMap).toList();
  }

  Future<void> deletePessoa(Pessoa pessoa) async {
    final Database db = await initializeDB();
    await db.delete(
      'pessoas',
      where: "nome = ?",
      whereArgs: [pessoa.nome],
    );
  }
}
