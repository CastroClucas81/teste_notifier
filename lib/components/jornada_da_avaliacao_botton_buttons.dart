import 'package:flutter/material.dart';
import 'package:teste_notifier/utils/strings.dart';

class JornadaDaAvaliacaoBottonButtons extends StatelessWidget {
  final VoidCallback goToResume;
  final VoidCallback goNext;
  final VoidCallback goPrevious;
  final bool showNext;
  final bool showPrevious;
  final bool showResume;

  const JornadaDaAvaliacaoBottonButtons({
    required this.goToResume,
    required this.goNext,
    required this.goPrevious,
    this.showNext = true,
    this.showPrevious = true,
    this.showResume = true,
    super.key,
  });

  double get _defaultButtonWidget => 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: showPrevious,
            replacement: SizedBox(
              width: _defaultButtonWidget,
            ),
            child: SizedBox(
              width: _defaultButtonWidget,
              child: ElevatedButton(
                onPressed: goPrevious,
                child: Text(Strings.voltar.text),
              ),
            ),
          ),
          Visibility(
            visible: showResume,
            replacement: SizedBox(
              width: _defaultButtonWidget,
            ),
            child: SizedBox(
              width: _defaultButtonWidget,
              child: OutlinedButton(
                onPressed: goToResume,
                child: Text(Strings.resumo.text),
              ),
            ),
          ),
          Visibility(
            visible: showNext,
            replacement: SizedBox(
              width: _defaultButtonWidget,
            ),
            child: SizedBox(
              width: _defaultButtonWidget,
              child: ElevatedButton(
                onPressed: goNext,
                child: Text(Strings.proximo.text),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
