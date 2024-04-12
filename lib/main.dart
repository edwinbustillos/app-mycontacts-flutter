import 'package:flutter/material.dart';
import 'package:mycontacts/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:mycontacts/providers/pessoa_provider.dart';
import 'package:mycontacts/repositories/pessoa_repository.dart';
import 'package:mycontacts/use_cases/pessoa_use_case.dart';
import 'package:mycontacts/screens/lista_pessoas.dart';
import 'package:mycontacts/screens/cadastro_pessoa.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PessoaProvider(
            useCase: PessoaUseCase(
              repository: PessoaRepository(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const ListaPessoasScreen(),
        '/cadastro': (context) => const CadastroPessoaScreen(),
      },
    );
  }
}
