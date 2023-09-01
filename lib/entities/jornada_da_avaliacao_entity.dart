// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:teste_notifier/entities/categoria_entity.dart';
import 'package:teste_notifier/entities/cor_entity.dart';
import 'package:teste_notifier/entities/observacao_entity.dart';
import 'package:teste_notifier/entities/tipo_de_combustivel_entity.dart';
import 'package:teste_notifier/utils/enums/cambio_enum.dart';

class JornadaDaAvaliacaoEntity extends Equatable {
  final num quilometragem;
  final CambioEnum cambio;
  final CategoriaEntity categoria;
  final CorEntity cor;
  final List<ObservacaoEntity> observacoes;
  final TipoDeCombustivelEntity tipoDeCombustivel;
  final String anoFabricacao;
  final String anoModelo;
  final String marca;
  final String modelo;

  const JornadaDaAvaliacaoEntity({
    required this.quilometragem,
    required this.cambio,
    required this.categoria,
    required this.cor,
    required this.observacoes,
    required this.tipoDeCombustivel,
    required this.anoFabricacao,
    required this.anoModelo,
    required this.marca,
    required this.modelo,
  });

  @override
  List<Object?> get props => [
        quilometragem,
        cambio,
        categoria,
        cor,
        observacoes,
        tipoDeCombustivel,
        anoFabricacao,
        anoModelo,
        marca,
        modelo
      ];
}
