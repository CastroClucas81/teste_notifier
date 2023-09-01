import 'package:teste_notifier/entities/observacao_entity.dart';

extension ObservacaoModel on ObservacaoEntity {
  ObservacaoEntity copyWith({
    String? id,
    String? nome,
  }) {
    return ObservacaoEntity(
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

  static ObservacaoEntity fromMap(Map<String, dynamic> map) {
    return ObservacaoEntity(
      id: map['id'] as String,
      nome: map['nome'] as String,
    );
  }
}
