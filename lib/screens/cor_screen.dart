import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/args/cor_args.dart';
import 'package:teste_notifier/components/jornada_da_avaliacao_title.dart';
import 'package:teste_notifier/cubits/cor/cor_cubit.dart';
import 'package:teste_notifier/cubits/cor/cor_state.dart';
import 'package:teste_notifier/entities/cor_entity.dart';

class CorScreen extends StatefulWidget {
  final CorArgs args;

  const CorScreen({required this.args, super.key});

  @override
  State<CorScreen> createState() => _CorScreenState();
}

class _CorScreenState extends State<CorScreen> {
  @override
  void initState() {
    context.read<CorCubit>().init();
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
              child: BlocBuilder<CorCubit, CorState>(
                builder: (context, state) {
                  if (state is CorLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }

                  if (state is CorSuccess) {
                    return ValueListenableBuilder<CorEntity>(
                      valueListenable: widget.args.cor,
                      builder: (context, cor, _) {
                        return ListView.builder(
                          itemCount: state.cores.length,
                          itemBuilder: (context, index) {
                            final currentCor = state.cores[index];

                            return RadioListTile<CorEntity>(
                              value: currentCor,
                              title: Text(currentCor.nome),
                              groupValue: cor,
                              onChanged: (value) {
                                widget.args.cor.value = value!;

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
            )
          ],
        ),
      ),
    );
  }
}
