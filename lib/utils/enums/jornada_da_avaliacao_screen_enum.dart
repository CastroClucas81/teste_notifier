enum JornadaDaAvaliacaoScreenEnum {
  quilometragem('Qual a quilometragem atual do'),
  tipoDeCambio('Escolha o tipo de câmbio'),
  tipoDeCombustivel('Escolha o tipo de combustivel'),
  categoria('A categoria do'),
  cor('Qual a cor do veículo?'),
  observacoes('Observações do veículo'),
  ;

  const JornadaDaAvaliacaoScreenEnum(this.title);

  final String title;
}
