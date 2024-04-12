class Pessoa {
  final String nome;
  final String telefone;
  final String fotoPath;

  Pessoa({
    required this.nome,
    required this.telefone,
    required this.fotoPath,
  });

  Map<String, Object?> toMap() {
    return {
      'nome': nome,
      'telefone': telefone,
      'fotoPath': fotoPath,
    };
  }

  static Pessoa fromMap(Map<String, Object?> map) {
    return Pessoa(
      nome: map['nome'] as String,
      telefone: map['telefone'] as String,
      fotoPath: map['fotoPath'] as String,
    );
  }
}
