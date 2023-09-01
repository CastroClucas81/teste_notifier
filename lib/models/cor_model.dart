import 'package:teste_notifier/entities/cor_entity.dart';

extension CorModel on CorEntity {
  CorEntity copyWith({
    String? id,
    String? nome,
  }) {
    return CorEntity(
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

  static CorEntity fromMap(Map<String, dynamic> map) {
    return CorEntity(
      id: map['id'] as String,
      nome: map['nome'] as String,
    );
  }
}
