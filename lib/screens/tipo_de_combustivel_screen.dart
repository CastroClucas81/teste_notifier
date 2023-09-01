import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/args/tipo_de_combustivel_args.dart';
import 'package:teste_notifier/components/jornada_da_avaliacao_title.dart';
import 'package:teste_notifier/cubits/tipo_de_combustivel/tipo_de_combustivel_cubit.dart';
import 'package:teste_notifier/cubits/tipo_de_combustivel/tipo_de_combustivel_state.dart';
import 'package:teste_notifier/entities/tipo_de_combustivel_entity.dart';

class TipoDeCombustivelScreen extends StatefulWidget {
  final TipoDeCombustivelArgs args;

  const TipoDeCombustivelScreen({required this.args, super.key});

  @override
  State<TipoDeCombustivelScreen> createState() =>
      _TipoDeCombustivelScreenState();
}

class _TipoDeCombustivelScreenState extends State<TipoDeCombustivelScreen> {
  @override
  void initState() {
    context.read<TipoDeCombustivelCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            JornadaDaAvaliacaoTitle(
              title: widget.args.jornadaDaAvaliacaoPageViewArgs
                  .jornadaDaAvaliacaoScreen.title,
            ),
            Expanded(
              child:
                  BlocBuilder<TipoDeCombustivelCubit, TipoDeCombustivelState>(
                builder: (context, state) {
                  if (state is TipoDeCombustivelLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }

                  if (state is TipoDeCombustivelSuccess) {
                    return ValueListenableBuilder<TipoDeCombustivelEntity>(
                      valueListenable: widget.args.tipoDeCombustivel,
                      builder: (context, tipoDeCombustivel, _) {
                        return ListView.builder(
                          itemCount: state.tiposDeCombustivel.length,
                          itemBuilder: (context, index) {
                            final currentTipoDeCombustivel =
                                state.tiposDeCombustivel[index];

                            return RadioListTile<TipoDeCombustivelEntity>(
                              value: currentTipoDeCombustivel,
                              title: Text(currentTipoDeCombustivel.nome),
                              groupValue: tipoDeCombustivel,
                              onChanged: (value) {
                                widget.args.tipoDeCombustivel.value = value!;
                                widget.args.jornadaDaAvaliacaoPageViewArgs
                                    .goNext();
                              },
                            );
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
