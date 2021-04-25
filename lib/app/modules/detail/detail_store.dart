import 'package:desafio_raro/app/shared/models/vaga_model.dart';
import 'package:desafio_raro/app/shared/repository/vagas_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'detail_store.g.dart';

class DetailStore = _DetailStoreBase with _$DetailStore;

abstract class _DetailStoreBase with Store {
  // Instance
  final IVagasRepository repository;

  // Obs Variables
  @observable
  ObservableStream<List<VagaModel>> vagasAvailable;

  _DetailStoreBase(this.repository) {
    buildStreamAvailable();
  }

  // Methods
  @action
  buildStreamAvailable() {
    return vagasAvailable = repository.fecthVagasDisponiveis().asObservable();
  }
}
