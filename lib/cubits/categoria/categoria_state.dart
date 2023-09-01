import 'package:equatable/equatable.dart';
import 'package:teste_notifier/entities/categoria_entity.dart';

class CategoriaState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoriaLoading extends CategoriaState {}

class CategoriaSuccess extends CategoriaState {
  final List<CategoriaEntity> categorias;

  CategoriaSuccess({required this.categorias});

  @override
  List<Object?> get props => [categorias];
}
