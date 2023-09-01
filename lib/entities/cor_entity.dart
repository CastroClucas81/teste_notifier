import 'package:equatable/equatable.dart';

class CorEntity extends Equatable {
  final String id;
  final String nome;

  const CorEntity({
    required this.id,
    required this.nome,
  });

  @override
  List<Object?> get props => [id, nome];
}
