import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mycontacts/providers/pessoa_provider.dart';
import 'package:mycontacts/entities/pessoa.dart';

class ListaPessoasScreen extends StatefulWidget {
  const ListaPessoasScreen({super.key});

  @override
  _ListaPessoasScreenState createState() => _ListaPessoasScreenState();
}

class _ListaPessoasScreenState extends State<ListaPessoasScreen> {
  Future<File> getImageFileFromAssets(String path) async {
    return File(path);
  }

  @override
  void initState() {
    super.initState();
    Provider.of<PessoaProvider>(context, listen: false).fetchPessoas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
      ),
      body: Consumer<PessoaProvider>(
        builder: (context, pessoaProvider, child) {
          return ListView.builder(
            itemCount: pessoaProvider.pessoas.length,
            itemBuilder: (context, index) {
              Pessoa pessoa = pessoaProvider.pessoas[index];
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.delete,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  pessoaProvider.removePessoa(pessoa);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${pessoa.nome} removido")),
                  );
                },
                child: FutureBuilder<File>(
                  future: getImageFileFromAssets(pessoa.fotoPath),
                  builder:
                      (BuildContext context, AsyncSnapshot<File> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListTile(
                        leading: snapshot.data!.path == 'assets/foto.png'
                            ? Image.asset('assets/foto.png')
                            : Image.file(snapshot.data!),
                        title: Text(pessoa.nome),
                        subtitle: Text(pessoa.telefone),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cadastro');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
