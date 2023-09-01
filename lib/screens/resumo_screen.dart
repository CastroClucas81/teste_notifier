import 'package:flutter/material.dart';
import 'package:teste_notifier/args/resumo_args.dart';
import 'package:teste_notifier/utils/enums/jornada_da_avaliacao_screen_enum.dart';
import 'package:teste_notifier/utils/strings.dart';

class ResumoScreen extends StatefulWidget {
  final ResumoArgs args;

  const ResumoScreen({required this.args, super.key});

  @override
  State<ResumoScreen> createState() => _ResumoScreenState();
}

class _ResumoScreenState extends State<ResumoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(Strings.quilometragem.text),
              subtitle: Text(
                widget.args.jornadaDaAvaliacao.quilometragem.toString(),
              ),
            ),
            ListTile(
              title: Text(Strings.anoFabricacao.text),
              subtitle: Text(
                widget.args.jornadaDaAvaliacao.anoFabricacao.toString(),
              ),
            ),
            ListTile(
              title: Text(Strings.categoria.text),
              subtitle: Text(
                widget.args.jornadaDaAvaliacao.categoria.toString(),
              ),
            ),
            ListTile(
              title: Text(Strings.observacoes.text),
              subtitle: Text(
                widget.args.jornadaDaAvaliacao.observacoes.join(', \n\n'),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: JornadaDaAvaliacaoScreenEnum.values.length,
                itemBuilder: (context, index) {
                  final currentJornadaAvaliacaoScreen =
                      JornadaDaAvaliacaoScreenEnum.values[index];
                  return OutlinedButton(
                    onPressed: () {
                      widget.args.goToPage(
                        pageIndex: currentJornadaAvaliacaoScreen.index,
                      );
                      Navigator.pop(context);
                    },
                    child: Text(currentJornadaAvaliacaoScreen.name),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
