import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/args/observacao_args.dart';
import 'package:teste_notifier/components/jornada_da_avaliacao_title.dart';
import 'package:teste_notifier/cubits/observacao/observacao_cubit.dart';
import 'package:teste_notifier/cubits/observacao/observacao_state.dart';
import 'package:teste_notifier/entities/observacao_entity.dart';

class ObservacaoScreen extends StatefulWidget {
  final ObservacaoArgs args;

  const ObservacaoScreen({required this.args, super.key});

  @override
  State<ObservacaoScreen> createState() => _ObservacaoScreenState();
}

class _ObservacaoScreenState extends State<ObservacaoScreen> {
  @override
  void initState() {
    context.read<ObservacaoCubit>().init();
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
              child: BlocBuilder<ObservacaoCubit, ObservacoesState>(
                builder: (context, state) {
                  if (state is ObservacoesLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }

                  if (state is ObservacoesSuccess) {
                    return ValueListenableBuilder<List<ObservacaoEntity>>(
                      valueListenable: widget.args.observacoes,
                      builder: (_, observacoes, context) {
                        return ListView.builder(
                          itemCount: state.observacoes.length,
                          itemBuilder: (context, index) {
                            final observacao = state.observacoes[index];

                            final matchObservacao = observacoes
                                .any((obs) => obs.id == observacao.id);

                            return CheckboxListTile(
                              value: matchObservacao,
                              onChanged: (value) {
                                final updatedObservacoes = [...observacoes];

                                if (matchObservacao) {
                                  updatedObservacoes.remove(observacao);
                                } else {
                                  updatedObservacoes.add(observacao);
                                }

                                widget.args.observacoes.value =
                                    updatedObservacoes;
                              },
                              title: Text(observacao.nome),
                            );
                          },
                        );
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
