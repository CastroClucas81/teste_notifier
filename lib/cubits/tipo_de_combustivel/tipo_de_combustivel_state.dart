import 'package:equatable/equatable.dart';
import 'package:teste_notifier/entities/tipo_de_combustivel_entity.dart';

class TipoDeCombustivelState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TipoDeCombustivelLoading extends TipoDeCombustivelState {}

class TipoDeCombustivelSuccess extends TipoDeCombustivelState {
  final List<TipoDeCombustivelEntity> tiposDeCombustivel;

  TipoDeCombustivelSuccess({required this.tiposDeCombustivel});

  @override
  List<Object?> get props => [super.props, tiposDeCombustivel];
}
