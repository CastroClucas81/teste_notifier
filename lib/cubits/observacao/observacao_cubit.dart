import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/cubits/observacao/observacao_state.dart';
import 'package:teste_notifier/models/observacao_model.dart';

class ObservacaoCubit extends Cubit<ObservacoesState> {
  ObservacaoCubit() : super(ObservacoesLoading());

  bool hasBeenInit = false;

  Future<void> init() async {
    if (hasBeenInit) return;

    final String response =
        await rootBundle.loadString('assets/jsons/observacoes.json');

    final result = jsonDecode(response);

    final observacoes = (result['data'] as List)
        .map(
          (observacao) => ObservacaoModel.fromMap(observacao),
        )
        .toList();

    emit(ObservacoesSuccess(observacoes: observacoes));

    hasBeenInit = true;
  }
}
