import 'package:teste_notifier/entities/categoria_entity.dart';
import 'package:teste_notifier/entities/cor_entity.dart';
import 'package:teste_notifier/entities/jornada_da_avaliacao_entity.dart';
import 'package:teste_notifier/entities/observacao_entity.dart';
import 'package:teste_notifier/entities/tipo_de_combustivel_entity.dart';
import 'package:teste_notifier/utils/enums/cambio_enum.dart';

extension JornadaDaAvaliacaoModel on JornadaDaAvaliacaoEntity {
  JornadaDaAvaliacaoEntity copyWith({
    num? quilometragem,
    CambioEnum? cambio,
    CategoriaEntity? categoria,
    CorEntity? cor,
    List<ObservacaoEntity>? observacoes,
    TipoDeCombustivelEntity? tipoDeCombustivel,
    String? anoFabricacao,
    String? anoModelo,
    String? marca,
    String? modelo,
  }) {
    return JornadaDaAvaliacaoEntity(
      quilometragem: quilometragem ?? this.quilometragem,
      cambio: cambio ?? this.cambio,
      categoria: categoria ?? this.categoria,
      cor: cor ?? this.cor,
      observacoes: observacoes ?? this.observacoes,
      tipoDeCombustivel: tipoDeCombustivel ?? this.tipoDeCombustivel,
      anoFabricacao: anoFabricacao ?? this.anoFabricacao,
      anoModelo: anoModelo ?? this.anoModelo,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
    );
  }
}
