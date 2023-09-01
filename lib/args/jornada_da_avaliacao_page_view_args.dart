import 'package:flutter/material.dart';
import 'package:teste_notifier/utils/enums/jornada_da_avaliacao_screen_enum.dart';

class JornadaDaAvaliacaoPageViewArgs {
  final VoidCallback goNext;
  final VoidCallback goPrevious;
  final void Function({required int pageIndex}) goToPage;
  final JornadaDaAvaliacaoScreenEnum jornadaDaAvaliacaoScreen;

  final void Function({
    VoidCallback? goPrevious,
    VoidCallback? goToResume,
    VoidCallback? goNext,
    bool? showNext,
    bool? showPrevious,
  }) updateBottonButtonsArgs;

  JornadaDaAvaliacaoPageViewArgs({
    required this.goNext,
    required this.goPrevious,
    required this.goToPage,
    required this.jornadaDaAvaliacaoScreen,
    required this.updateBottonButtonsArgs,
  });
}
