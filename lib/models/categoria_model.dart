import 'package:teste_notifier/entities/categoria_entity.dart';

extension CategoriaModel on CategoriaEntity {
  CategoriaEntity copyWith({
    String? id,
    String? nome,
  }) {
    return CategoriaEntity(
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

  static CategoriaEntity fromMap(Map<String, dynamic> map) {
    return CategoriaEntity(
      id: map['id'] as String,
      nome: map['nome'] as String,
    );
  }
}
