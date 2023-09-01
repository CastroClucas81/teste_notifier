import 'package:flutter/material.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_page_view_args.dart';

class QuilometragemArgs {
  final JornadaDaAvaliacaoPageViewArgs jornadaDaAvaliacaoPageViewArgs;
  final ValueNotifier<num> quilometragem;

  QuilometragemArgs({
    required this.jornadaDaAvaliacaoPageViewArgs,
    required this.quilometragem,
  });
}
