import 'package:desafio_raro/app/shared/models/vaga_model.dart';

abstract class IVagasRepository {
  Stream<List<VagaModel>> fecthVagas();
  Stream<List<VagaModel>> fecthVagasDisponiveis();
  Stream<List<VagaModel>> fecthVagasOcupadas();
}
