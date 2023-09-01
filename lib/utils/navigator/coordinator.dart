import 'package:flutter/material.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_args.dart';
import 'package:teste_notifier/args/resumo_args.dart';
import 'package:teste_notifier/utils/inject/inject.dart';
import 'package:teste_notifier/utils/navigator/routes.dart';

class Coordinator {
  static GlobalKey<NavigatorState> get globalKey =>
      Inject.get<GlobalKey<NavigatorState>>();

  static Future<void> goToJornadaDaAvaliacao(
      {required JornadaDaAvaliacaoArgs args}) async {
    await globalKey.currentState!.pushNamed(
      Routes.jornadaDaAvaliacao.route,
      arguments: args,
    );
  }

  static Future<void> goToResumo({required ResumoArgs args}) async {
    await globalKey.currentState!.pushNamed(
      Routes.resumo.route,
      arguments: args,
    );
  }
}
