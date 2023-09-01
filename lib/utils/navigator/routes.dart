import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_args.dart';
import 'package:teste_notifier/args/resumo_args.dart';
import 'package:teste_notifier/cubits/cadastro_veiculo/cadastro_veiculo_cubit.dart';
import 'package:teste_notifier/cubits/categoria/categoria_cubit.dart';
import 'package:teste_notifier/cubits/cor/cor_cubit.dart';
import 'package:teste_notifier/cubits/observacao/observacao_cubit.dart';
import 'package:teste_notifier/cubits/tipo_de_combustivel/tipo_de_combustivel_cubit.dart';
import 'package:teste_notifier/screens/jornada_da_avaliacao_screen.dart';
import 'package:teste_notifier/screens/cadastro_veiculo_screen.dart';
import 'package:teste_notifier/screens/resumo_screen.dart';
import 'package:teste_notifier/utils/inject/inject.dart';

enum Routes {
  cadastroVeiculoCubit('cadastro_veiculo_page'),
  jornadaDaAvaliacao('jornada_da_avaliacao_page'),
  resumo('resumo_page');

  const Routes(this.route);

  final String route;

  static final Map<String, WidgetBuilder> routes = {
    cadastroVeiculoCubit.route: (context) => BlocProvider(
          create: (_) => Inject.get<CadastroVeiculoCubit>(),
          child: const CadastroVeiculoScreen(),
        ),
    resumo.route: (context) => ResumoScreen(
          args: ModalRoute.of(context)!.settings.arguments as ResumoArgs,
        ),
    jornadaDaAvaliacao.route: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => Inject.get<TipoDeCombustivelCubit>(),
            ),
            BlocProvider(
              create: (_) => Inject.get<CategoriaCubit>(),
            ),
            BlocProvider(
              create: (_) => Inject.get<CorCubit>(),
            ),
            BlocProvider(
              create: (_) => Inject.get<ObservacaoCubit>(),
            ),
          ],
          child: JornadaDaAvaliacaoScreen(
            args: ModalRoute.of(context)!.settings.arguments
                as JornadaDaAvaliacaoArgs,
          ),
        )
  };
}
