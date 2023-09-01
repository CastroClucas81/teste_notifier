import 'package:flutter/material.dart';

class JornadaDaAvaliacaoTitle extends StatelessWidget {
  final String title;

  const JornadaDaAvaliacaoTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
