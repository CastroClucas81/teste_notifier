import 'package:flutter/material.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_page_view_args.dart';
import 'package:teste_notifier/entities/categoria_entity.dart';

class CategoriaArgs {
  final JornadaDaAvaliacaoPageViewArgs jornadaDaAvaliacaoPageViewArgs;
  final ValueNotifier<CategoriaEntity> categoria;

  CategoriaArgs({
    required this.jornadaDaAvaliacaoPageViewArgs,
    required this.categoria,
  });
}
