import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_args.dart';
import 'package:teste_notifier/components/input.dart';
import 'package:teste_notifier/cubits/cadastro_veiculo/cadastro_veiculo_cubit.dart';
import 'package:teste_notifier/cubits/cadastro_veiculo/cadastro_veiculo_state.dart';
import 'package:teste_notifier/utils/navigator/coordinator.dart';
import 'package:teste_notifier/utils/strings.dart';

class CadastroVeiculoScreen extends StatefulWidget {
  const CadastroVeiculoScreen({super.key});

  @override
  State<CadastroVeiculoScreen> createState() => _CadastroVeiculoScreenState();
}

class _CadastroVeiculoScreenState extends State<CadastroVeiculoScreen> {
  late final CadastroVeiculoCubit _oqueFazerCubit;
  final _formKey = GlobalKey<FormState>();
  final _anoFabricacaoController = TextEditingController();
  final _anoModeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _modeloController = TextEditingController();

  @override
  void initState() {
    _oqueFazerCubit = context.read<CadastroVeiculoCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.cadastroDoVeiculo.text),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Input(
                        label: Strings.anoFabricacao.text,
                        controller: _anoFabricacaoController,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Input(
                        label: Strings.anoModelo.text,
                        controller: _anoModeloController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Input(
                  label: Strings.marca.text,
                  controller: _marcaController,
                ),
                const SizedBox(height: 10),
                Input(
                  label: Strings.modelo.text,
                  controller: _modeloController,
                ),
                const SizedBox(height: 10),
                BlocConsumer<CadastroVeiculoCubit, CadastroVeiculoState>(
                  listener: (context, state) {
                    if (state is CadastroVeiculoSuccess) {
                      Coordinator.goToJornadaDaAvaliacao(
                        args: JornadaDaAvaliacaoArgs(
                          jornadaDaAvaliacaoEntity:
                              state.jornadaDaAvaliacaoEntity,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (state is! CadastroVeiculoLoading &&
                              _formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            _oqueFazerCubit.submit(
                              anoFabricacao: _anoFabricacaoController.text,
                              anoModelo: _anoModeloController.text,
                              marca: _marcaController.text,
                              modelo: _modeloController.text,
                            );
                          }
                        },
                        child: state is CadastroVeiculoLoading
                            ? const CupertinoActivityIndicator(
                                color: Colors.white,
                              )
                            : const Text('Próximo'),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _anoFabricacaoController.dispose();
    _anoModeloController.dispose();
    _marcaController.dispose();
    _modeloController.dispose();
    super.dispose();
  }
}
