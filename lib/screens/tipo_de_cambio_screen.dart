import 'package:flutter/material.dart';
import 'package:teste_notifier/args/tipo_de_cambio_args.dart';
import 'package:teste_notifier/components/jornada_da_avaliacao_title.dart';
import 'package:teste_notifier/utils/enums/cambio_enum.dart';

class TipoDeCambioScreen extends StatefulWidget {
  final TipoDeCambioArgs args;

  const TipoDeCambioScreen({required this.args, super.key});

  @override
  State<TipoDeCambioScreen> createState() => _TipoDeCambioScreenState();
}

class _TipoDeCambioScreenState extends State<TipoDeCambioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              JornadaDaAvaliacaoTitle(
                title: widget.args.jornadaDaAvaliacaoPageViewArgs
                    .jornadaDaAvaliacaoScreen.title,
              ),
              ValueListenableBuilder<CambioEnum>(
                valueListenable: widget.args.cambio,
                builder: (context, cambio, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: CambioEnum.values.length,
                    itemBuilder: (context, index) {
                      final currentCambio = CambioEnum.values[index];

                      return RadioListTile<CambioEnum>(
                        value: currentCambio,
                        title: Text(currentCambio.title),
                        groupValue: cambio,
                        onChanged: (value) {
                          widget.args.cambio.value = value!;
                          widget.args.jornadaDaAvaliacaoPageViewArgs.goNext();
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
