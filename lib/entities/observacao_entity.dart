import 'package:equatable/equatable.dart';

class ObservacaoEntity extends Equatable {
  final String id;
  final String nome;

  const ObservacaoEntity({
    required this.id,
    required this.nome,
  });

  @override
  List<Object?> get props => [id, nome];
}
