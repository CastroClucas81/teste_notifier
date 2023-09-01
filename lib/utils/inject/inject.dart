import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_notifier/cubits/cadastro_veiculo/cadastro_veiculo_cubit.dart';
import 'package:teste_notifier/cubits/categoria/categoria_cubit.dart';
import 'package:teste_notifier/cubits/cor/cor_cubit.dart';
import 'package:teste_notifier/cubits/observacao/observacao_cubit.dart';
import 'package:teste_notifier/cubits/tipo_de_combustivel/tipo_de_combustivel_cubit.dart';

class Inject {
  static GetIt get get => GetIt.instance;

  final GetIt _getIt = get;

  GetIt get getIt => _getIt;

  Inject._() {
    getIt.registerSingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>(),
    );
    getIt.registerFactory(() => CadastroVeiculoCubit());
    getIt.registerFactory(() => TipoDeCombustivelCubit());
    getIt.registerFactory(() => CategoriaCubit());
    getIt.registerFactory(() => CorCubit());
    getIt.registerFactory(() => ObservacaoCubit());
  }

  Inject.initialize() : this._();
}
