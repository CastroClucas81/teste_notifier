import 'package:flutter/material.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_page_view_args.dart';
import 'package:teste_notifier/entities/cor_entity.dart';

class CorArgs {
  final JornadaDaAvaliacaoPageViewArgs jornadaDaAvaliacaoPageViewArgs;
  final ValueNotifier<CorEntity> cor;

  CorArgs({
    required this.jornadaDaAvaliacaoPageViewArgs,
    required this.cor,
  });
}
