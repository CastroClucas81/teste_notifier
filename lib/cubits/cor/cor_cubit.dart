import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/cubits/cor/cor_state.dart';
import 'package:teste_notifier/models/cor_model.dart';

class CorCubit extends Cubit<CorState> {
  CorCubit() : super(CorLoading());

  bool hasBeenInit = false;

  Future<void> init() async {
    if (hasBeenInit) return;

    final String response =
        await rootBundle.loadString('assets/jsons/cores.json');

    final result = jsonDecode(response);

    final cores = (result['data'] as List)
        .map(
          (cor) => CorModel.fromMap(cor),
        )
        .toList();

    emit(CorSuccess(cores: cores));

    hasBeenInit = true;
  }
}
