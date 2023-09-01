import 'package:equatable/equatable.dart';
import 'package:teste_notifier/entities/observacao_entity.dart';

class ObservacoesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ObservacoesLoading extends ObservacoesState {}

class ObservacoesSuccess extends ObservacoesState {
  final List<ObservacaoEntity> observacoes;

  ObservacoesSuccess({required this.observacoes});

  @override
  List<Object?> get props => [super.props, observacoes];
}
