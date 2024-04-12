import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:mycontacts/providers/pessoa_provider.dart';
import 'package:mycontacts/entities/pessoa.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class CadastroPessoaScreen extends StatefulWidget {
  const CadastroPessoaScreen({super.key});

  @override
  _CadastroPessoaScreenState createState() => _CadastroPessoaScreenState();
}

class _CadastroPessoaScreenState extends State<CadastroPessoaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _telefoneController = MaskedTextController(mask: '(00) 0000-0000');
  String? _fotoPath;

  Future<void> _tirarFoto() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _fotoPath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Contato'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _telefoneController,
                  decoration: const InputDecoration(labelText: 'Telefone'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o telefone';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 70, 126), // Cor da borda
                        width: 3.0, // Espessura da borda
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: _fotoPath != null
                          ? FileImage(File(_fotoPath!)) as ImageProvider<Object>
                          : const AssetImage('assets/foto.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: _tirarFoto,
                    child: const Text('Tirar Foto'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _fotoPath ??= 'assets/foto.png';
                        Provider.of<PessoaProvider>(context, listen: false)
                            .addPessoa(
                          Pessoa(
                            nome: _nomeController.text,
                            telefone: _telefoneController.text,
                            fotoPath: _fotoPath!,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
