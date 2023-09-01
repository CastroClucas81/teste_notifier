import 'package:equatable/equatable.dart';

class TipoDeCombustivelEntity extends Equatable {
  final String id;
  final String nome;

  const TipoDeCombustivelEntity({
    required this.id,
    required this.nome,
  });

  @override
  List<Object?> get props => [id, nome];
}
