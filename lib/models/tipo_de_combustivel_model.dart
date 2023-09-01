import 'package:teste_notifier/entities/tipo_de_combustivel_entity.dart';

extension TipoDeCombustivelModel on TipoDeCombustivelEntity {
  TipoDeCombustivelEntity copyWith({
    String? id,
    String? nome,
  }) {
    return TipoDeCombustivelEntity(
      id: id ?? this.id,
      nome: nome ?? this.nome,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
    };
  }

  static TipoDeCombustivelEntity fromMap(Map<String, dynamic> map) {
    return TipoDeCombustivelEntity(
      id: map['id'] as String,
      nome: map['nome'] as String,
    );
  }
}
