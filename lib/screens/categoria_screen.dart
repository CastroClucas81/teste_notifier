import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/args/categoria_args.dart';
import 'package:teste_notifier/components/jornada_da_avaliacao_title.dart';
import 'package:teste_notifier/cubits/categoria/categoria_cubit.dart';
import 'package:teste_notifier/cubits/categoria/categoria_state.dart';
import 'package:teste_notifier/entities/categoria_entity.dart';

class CategoriaScreen extends StatefulWidget {
  final CategoriaArgs args;

  const CategoriaScreen({required this.args, super.key});

  @override
  State<CategoriaScreen> createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
  @override
  void initState() {
    context.read<CategoriaCubit>().init();
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
              child: BlocBuilder<CategoriaCubit, CategoriaState>(
                builder: (context, state) {
                  if (state is CategoriaLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }

                  if (state is CategoriaSuccess) {
                    return ValueListenableBuilder<CategoriaEntity>(
                      valueListenable: widget.args.categoria,
                      builder: (context, categoria, _) {
                        return ListView.builder(
                          itemCount: state.categorias.length,
                          itemBuilder: (context, index) {
                            final currentCategoria = state.categorias[index];

                            return RadioListTile<CategoriaEntity>(
                              value: currentCategoria,
                              title: Text(currentCategoria.nome),
                              groupValue: categoria,
                              onChanged: (value) {
                                widget.args.categoria.value = value!;
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
