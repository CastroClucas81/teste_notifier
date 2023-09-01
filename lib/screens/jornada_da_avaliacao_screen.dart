import 'package:flutter/material.dart';
import 'package:teste_notifier/args/categoria_args.dart';
import 'package:teste_notifier/args/cor_args.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_args.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_page_view_args.dart';
import 'package:teste_notifier/args/jornada_da_avaliacao_page_view_botton_buttons_args.dart';
import 'package:teste_notifier/args/observacao_args.dart';
import 'package:teste_notifier/args/quilometragem_args.dart';
import 'package:teste_notifier/args/resumo_args.dart';
import 'package:teste_notifier/args/tipo_de_cambio_args.dart';
import 'package:teste_notifier/args/tipo_de_combustivel_args.dart';
import 'package:teste_notifier/components/jornada_da_avaliacao_botton_buttons.dart';
import 'package:teste_notifier/entities/categoria_entity.dart';
import 'package:teste_notifier/entities/cor_entity.dart';
import 'package:teste_notifier/entities/jornada_da_avaliacao_entity.dart';
import 'package:teste_notifier/entities/observacao_entity.dart';
import 'package:teste_notifier/entities/tipo_de_combustivel_entity.dart';
import 'package:teste_notifier/screens/categoria_screen.dart';
import 'package:teste_notifier/screens/cor_screen.dart';
import 'package:teste_notifier/screens/observacao_screen.dart';
import 'package:teste_notifier/screens/quilometragem_screen.dart';
import 'package:teste_notifier/screens/tipo_de_cambio_screen.dart';
import 'package:teste_notifier/screens/tipo_de_combustivel_screen.dart';
import 'package:teste_notifier/utils/enums/cambio_enum.dart';
import 'package:teste_notifier/utils/enums/jornada_da_avaliacao_screen_enum.dart';
import 'package:teste_notifier/utils/navigator/coordinator.dart';

class JornadaDaAvaliacaoScreen extends StatefulWidget {
  final JornadaDaAvaliacaoArgs args;

  const JornadaDaAvaliacaoScreen({required this.args, super.key});

  @override
  State<JornadaDaAvaliacaoScreen> createState() =>
      _JornadaDaAvaliacaoScreenState();
}

class _JornadaDaAvaliacaoScreenState extends State<JornadaDaAvaliacaoScreen> {
  late final ValueNotifier<num> _quilometragem;
  late final ValueNotifier<CambioEnum> _cambio;
  late final ValueNotifier<CategoriaEntity> _categoria;
  late final ValueNotifier<CorEntity> _cor;
  late final ValueNotifier<List<ObservacaoEntity>> _observacoes;
  late final ValueNotifier<TipoDeCombustivelEntity> _tipoDeCombustivel;
  late final ValueNotifier<String> _anoFabricacao;
  late final ValueNotifier<String> _anoModelo;
  late final ValueNotifier<String> _marca;
  late final ValueNotifier<String> _modelo;
  late final ValueNotifier<JornadaDaAvaliacaoPageViewBottonButtonsArgs>
      _jornadaDaAvaliacaoPageViewBottonButtonsArgs;
  final _currentPage = ValueNotifier<JornadaDaAvaliacaoScreenEnum>(
      JornadaDaAvaliacaoScreenEnum.quilometragem);
  final _pageViewController = PageController();

  Future<void> _goNext() async {
    FocusScope.of(context).unfocus();
    await _pageViewController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  Future<void> _goPrevious() async {
    FocusScope.of(context).unfocus();
    await _pageViewController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _goToResumo() {
    Coordinator.goToResumo(
      args: ResumoArgs(
        goToPage: _goToPage,
        jornadaDaAvaliacao: JornadaDaAvaliacaoEntity(
          quilometragem: _quilometragem.value,
          cambio: _cambio.value,
          categoria: _categoria.value,
          cor: _cor.value,
          observacoes: _observacoes.value,
          tipoDeCombustivel: _tipoDeCombustivel.value,
          anoFabricacao: _anoFabricacao.value,
          anoModelo: _anoModelo.value,
          marca: _marca.value,
          modelo: _modelo.value,
        ),
      ),
    );
  }

  void _goToPage({required int pageIndex}) {
    _pageViewController.jumpToPage(pageIndex);
  }

  void _handleValueNotifiers() {
    final jornadaDaAvaliacao = widget.args.jornadaDaAvaliacaoEntity;

    _quilometragem = ValueNotifier(jornadaDaAvaliacao.quilometragem);
    _cambio = ValueNotifier<CambioEnum>(jornadaDaAvaliacao.cambio);
    _categoria = ValueNotifier<CategoriaEntity>(jornadaDaAvaliacao.categoria);
    _cor = ValueNotifier<CorEntity>(jornadaDaAvaliacao.cor);
    _observacoes =
        ValueNotifier<List<ObservacaoEntity>>(jornadaDaAvaliacao.observacoes);
    _tipoDeCombustivel = ValueNotifier<TipoDeCombustivelEntity>(
        jornadaDaAvaliacao.tipoDeCombustivel);
    _anoFabricacao = ValueNotifier<String>(jornadaDaAvaliacao.anoFabricacao);
    _anoModelo = ValueNotifier<String>(jornadaDaAvaliacao.anoModelo);
    _marca = ValueNotifier<String>(jornadaDaAvaliacao.marca);
    _modelo = ValueNotifier<String>(jornadaDaAvaliacao.modelo);
  }

  void _handleBottonButtonsArgs({
    VoidCallback? goPrevious,
    VoidCallback? goToResume,
    VoidCallback? goNext,
    bool? showNext,
    bool? showPrevious,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _jornadaDaAvaliacaoPageViewBottonButtonsArgs.value =
          _jornadaDaAvaliacaoPageViewBottonButtonsArgs.value.copyWith(
        goNext: goPrevious ?? _goNext,
        goPrevious: goNext ?? _goPrevious,
        goToResume: goToResume ?? _goToResumo,
        showNext: showNext ?? true,
        showPrevious: showPrevious ?? true,
      );
    });
  }

  @override
  void initState() {
    _handleValueNotifiers();

    _jornadaDaAvaliacaoPageViewBottonButtonsArgs =
        ValueNotifier<JornadaDaAvaliacaoPageViewBottonButtonsArgs>(
      JornadaDaAvaliacaoPageViewBottonButtonsArgs(
        goPrevious: _goPrevious,
        goNext: _goNext,
        goToResume: _goToResumo,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageViewController,
                itemCount: JornadaDaAvaliacaoScreenEnum.values.length,
                onPageChanged: (currentIndex) {
                  _currentPage.value =
                      JornadaDaAvaliacaoScreenEnum.values.firstWhere(
                    (jornadaDaAvalicaoScreen) =>
                        jornadaDaAvalicaoScreen.index == currentIndex,
                  );
                },
                itemBuilder: (context, index) {
                  final jornadaDaAvaliacaoScreen =
                      JornadaDaAvaliacaoScreenEnum.values[index];

                  final jornadaDaAvaliacaoPageViewArgs =
                      JornadaDaAvaliacaoPageViewArgs(
                    jornadaDaAvaliacaoScreen: jornadaDaAvaliacaoScreen,
                    goNext: _goNext,
                    goPrevious: _goPrevious,
                    goToPage: _goToPage,
                    updateBottonButtonsArgs: _handleBottonButtonsArgs,
                  );

                  switch (jornadaDaAvaliacaoScreen) {
                    case JornadaDaAvaliacaoScreenEnum.quilometragem:
                      return QuilometragemScreen(
                        args: QuilometragemArgs(
                          jornadaDaAvaliacaoPageViewArgs:
                              jornadaDaAvaliacaoPageViewArgs,
                          quilometragem: _quilometragem,
                        ),
                      );
                    case JornadaDaAvaliacaoScreenEnum.tipoDeCambio:
                      return TipoDeCambioScreen(
                        args: TipoDeCambioArgs(
                          jornadaDaAvaliacaoPageViewArgs:
                              jornadaDaAvaliacaoPageViewArgs,
                          cambio: _cambio,
                        ),
                      );
                    case JornadaDaAvaliacaoScreenEnum.tipoDeCombustivel:
                      return TipoDeCombustivelScreen(
                        args: TipoDeCombustivelArgs(
                          jornadaDaAvaliacaoPageViewArgs:
                              jornadaDaAvaliacaoPageViewArgs,
                          tipoDeCombustivel: _tipoDeCombustivel,
                        ),
                      );
                    case JornadaDaAvaliacaoScreenEnum.categoria:
                      return CategoriaScreen(
                        args: CategoriaArgs(
                          jornadaDaAvaliacaoPageViewArgs:
                              jornadaDaAvaliacaoPageViewArgs,
                          categoria: _categoria,
                        ),
                      );
                    case JornadaDaAvaliacaoScreenEnum.cor:
                      return CorScreen(
                        args: CorArgs(
                            jornadaDaAvaliacaoPageViewArgs:
                                jornadaDaAvaliacaoPageViewArgs,
                            cor: _cor),
                      );
                    case JornadaDaAvaliacaoScreenEnum.observacoes:
                      return ObservacaoScreen(
                        args: ObservacaoArgs(
                            jornadaDaAvaliacaoPageViewArgs:
                                jornadaDaAvaliacaoPageViewArgs,
                            observacoes: _observacoes),
                      );
                  }
                },
              ),
            ),
            //_jornadaDaAvaliacaoPageViewBottonButtons
            ValueListenableBuilder<JornadaDaAvaliacaoPageViewBottonButtonsArgs>(
              valueListenable: _jornadaDaAvaliacaoPageViewBottonButtonsArgs,
              builder: (context, pageViewBttonButtons, _) {
                return JornadaDaAvaliacaoBottonButtons(
                  goToResume: pageViewBttonButtons.goToResume,
                  goNext: pageViewBttonButtons.goNext,
                  goPrevious: pageViewBttonButtons.goPrevious,
                  showNext: pageViewBttonButtons.showNext,
                  showPrevious: pageViewBttonButtons.showPrevious,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _currentPage.dispose();
    _quilometragem.dispose();
    _cambio.dispose();
    _categoria.dispose();
    _cor.dispose();
    _observacoes.dispose();
    _tipoDeCombustivel.dispose();
    _anoFabricacao.dispose();
    _anoModelo.dispose();
    _marca.dispose();
    _modelo.dispose();
    _jornadaDaAvaliacaoPageViewBottonButtonsArgs.dispose();
    super.dispose();
  }
}
