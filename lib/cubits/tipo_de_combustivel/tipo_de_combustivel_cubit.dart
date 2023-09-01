import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/cubits/tipo_de_combustivel/tipo_de_combustivel_state.dart';
import 'package:teste_notifier/models/tipo_de_combustivel_model.dart';

class TipoDeCombustivelCubit extends Cubit<TipoDeCombustivelState> {
  TipoDeCombustivelCubit() : super(TipoDeCombustivelLoading());

  bool hasBeenInit = false;

  Future<void> init() async {
    if (hasBeenInit) return;

    final String response =
        await rootBundle.loadString('assets/jsons/tipos_de_combustivel.json');

    final result = jsonDecode(response);

    final tiposDeCombustivel = (result['data'] as List)
        .map((tipoDeCombustivel) =>
            TipoDeCombustivelModel.fromMap(tipoDeCombustivel))
        .toList();

    emit(TipoDeCombustivelSuccess(tiposDeCombustivel: tiposDeCombustivel));
    hasBeenInit = true;
  }
}
