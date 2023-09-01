import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_notifier/args/quilometragem_args.dart';
import 'package:teste_notifier/components/input.dart';
import 'package:teste_notifier/components/jornada_da_avaliacao_title.dart';

class QuilometragemScreen extends StatefulWidget {
  final QuilometragemArgs args;

  const QuilometragemScreen({required this.args, super.key});

  @override
  State<QuilometragemScreen> createState() => _QuilometragemScreenState();
}

class _QuilometragemScreenState extends State<QuilometragemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _quilometragemController = TextEditingController();

  @override
  void initState() {
    _quilometragemController.text = widget.args.quilometragem.value.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                JornadaDaAvaliacaoTitle(
                  title: widget.args.jornadaDaAvaliacaoPageViewArgs
                      .jornadaDaAvaliacaoScreen.title,
                ),
                Input(
                  label: '',
                  controller: _quilometragemController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    widget.args.quilometragem.value = num.tryParse(value) ?? 0;
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
    _quilometragemController.dispose();
    super.dispose();
  }
}
