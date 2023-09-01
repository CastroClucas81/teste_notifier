import 'package:flutter/material.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_page_view_args.dart';
import 'package:teste_notifier/entities/tipo_de_combustivel_entity.dart';

class TipoDeCombustivelArgs {
  final JornadaDaAvaliacaoPageViewArgs jornadaDaAvaliacaoPageViewArgs;
  final ValueNotifier<TipoDeCombustivelEntity> tipoDeCombustivel;

  TipoDeCombustivelArgs({
    required this.jornadaDaAvaliacaoPageViewArgs,
    required this.tipoDeCombustivel,
  });
}
