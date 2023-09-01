import 'package:flutter/material.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_page_view_args.dart';
import 'package:teste_notifier/utils/enums/cambio_enum.dart';

class TipoDeCambioArgs {
  final JornadaDaAvaliacaoPageViewArgs jornadaDaAvaliacaoPageViewArgs;
  final ValueNotifier<CambioEnum> cambio;

  TipoDeCambioArgs({
    required this.jornadaDaAvaliacaoPageViewArgs,
    required this.cambio,
  });
}
