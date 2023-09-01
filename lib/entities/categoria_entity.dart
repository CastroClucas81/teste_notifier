import 'package:equatable/equatable.dart';

class CategoriaEntity extends Equatable {
  final String id;
  final String nome;

  const CategoriaEntity({
    required this.id,
    required this.nome,
  });

  @override
  List<Object?> get props => [id, nome];
}
