import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_notifier/cubits/cadastro_veiculo/cadastro_veiculo_state.dart';

import 'package:teste_notifier/entities/categoria_entity.dart';
import 'package:teste_notifier/entities/cor_entity.dart';
import 'package:teste_notifier/entities/jornada_da_avaliacao_entity.dart';
import 'package:teste_notifier/entities/observacao_entity.dart';
import 'package:teste_notifier/entities/tipo_de_combustivel_entity.dart';
import 'package:teste_notifier/utils/enums/cambio_enum.dart';

class CadastroVeiculoCubit extends Cubit<CadastroVeiculoState> {
  CadastroVeiculoCubit() : super(CadastroVeiculoInitial());

  Future<void> submit({
    required String anoFabricacao,
    required String anoModelo,
    required String marca,
    required String modelo,
  }) async {
    emit(CadastroVeiculoLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(
      CadastroVeiculoSuccess(
        jornadaDaAvaliacaoEntity: JornadaDaAvaliacaoEntity(
          quilometragem: 0,
          anoFabricacao: anoFabricacao,
          anoModelo: anoModelo,
          marca: marca,
          modelo: modelo,
          cambio: CambioEnum.automatico,
          categoria: const CategoriaEntity(
            id: "d5ec4eb9-e2e2-47c4-bf63-03e1c33b7a63",
            nome: "Caminhão",
          ),
          cor: const CorEntity(
            id: "2a2c2e16-935d-42a6-99b4-82b457b17ea6",
            nome: "Azul",
          ),
          observacoes: const [
            ObservacaoEntity(
              id: "123db938-1e54-4e59-90e2-70e94a1c9386",
              nome: "Baixa KM",
            )
          ],
          tipoDeCombustivel: const TipoDeCombustivelEntity(
            id: "e2648df7-721f-4eac-8ed0-5968d3a59a0c",
            nome: "Diesel",
          ),
        ),
      ),
    );
  }
}
