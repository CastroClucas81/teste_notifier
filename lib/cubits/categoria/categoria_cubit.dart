import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/cubits/categoria/categoria_state.dart';
import 'package:teste_notifier/models/categoria_model.dart';

class CategoriaCubit extends Cubit<CategoriaState> {
  CategoriaCubit() : super(CategoriaLoading());

  bool hasBeenInit = false;

  Future<void> init() async {
    if (hasBeenInit) return;

    final String response =
        await rootBundle.loadString('assets/jsons/categorias.json');

    final result = jsonDecode(response);

    final categorias = (result['data'] as List)
        .map((categoria) => CategoriaModel.fromMap(categoria))
        .toList();

    emit(CategoriaSuccess(categorias: categorias));
    hasBeenInit = true;
  }
}
