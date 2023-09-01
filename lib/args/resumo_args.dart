import 'package:teste_notifier/entities/jornada_da_avaliacao_entity.dart';

class ResumoArgs {
  final void Function({required int pageIndex}) goToPage;
  final JornadaDaAvaliacaoEntity jornadaDaAvaliacao;

  ResumoArgs({
    required this.goToPage,
    required this.jornadaDaAvaliacao,
  });
}
