import 'package:flutter/material.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_page_view_args.dart';
import 'package:teste_notifier/entities/observacao_entity.dart';

class ObservacaoArgs {
  final JornadaDaAvaliacaoPageViewArgs jornadaDaAvaliacaoPageViewArgs;
  final ValueNotifier<List<ObservacaoEntity>> observacoes;

  ObservacaoArgs({
    required this.jornadaDaAvaliacaoPageViewArgs,
    required this.observacoes,
  });
}
