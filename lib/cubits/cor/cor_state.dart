import 'package:equatable/equatable.dart';
import 'package:teste_notifier/entities/cor_entity.dart';

class CorState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CorLoading extends CorState {}

class CorSuccess extends CorState {
  final List<CorEntity> cores;

  CorSuccess({required this.cores});

  @override
  List<Object?> get props => [cores];
}
