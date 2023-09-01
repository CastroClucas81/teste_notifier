import 'package:flutter/material.dart';

class JornadaDaAvaliacaoPageViewBottonButtonsArgs {
  final VoidCallback goPrevious;
  final VoidCallback goToResume;
  final VoidCallback goNext;
  final bool showNext;
  final bool showPrevious;

  JornadaDaAvaliacaoPageViewBottonButtonsArgs({
    required this.goPrevious,
    required this.goToResume,
    required this.goNext,
    this.showNext = true,
    this.showPrevious = true,
  });

  JornadaDaAvaliacaoPageViewBottonButtonsArgs copyWith({
    VoidCallback? goPrevious,
    VoidCallback? goToResume,
    VoidCallback? goNext,
    bool? showNext,
    bool? showPrevious,
  }) {
    return JornadaDaAvaliacaoPageViewBottonButtonsArgs(
      goPrevious: goPrevious ?? this.goPrevious,
      goToResume: goToResume ?? this.goToResume,
      goNext: goNext ?? this.goNext,
      showNext: showNext ?? this.showNext,
      showPrevious: showPrevious ?? this.showPrevious,
    );
  }
}
