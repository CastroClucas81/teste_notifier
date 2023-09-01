import 'package:equatable/equatable.dart';
import 'package:teste_notifier/entities/jornada_da_avaliacao_entity.dart';

abstract class CadastroVeiculoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CadastroVeiculoInitial extends CadastroVeiculoState {}

class CadastroVeiculoLoading extends CadastroVeiculoState {}

class CadastroVeiculoError extends CadastroVeiculoState {}

class CadastroVeiculoSuccess extends CadastroVeiculoState {
  final JornadaDaAvaliacaoEntity jornadaDaAvaliacaoEntity;

  CadastroVeiculoSuccess({required this.jornadaDaAvaliacaoEntity});

  @override
  List<Object?> get props => [super.props, jornadaDaAvaliacaoEntity];
}
