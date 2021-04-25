import 'package:desafio_raro/app/shared/models/vaga_model.dart';
import 'package:desafio_raro/app/shared/repository/vagas_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  // Instance
  final IVagasRepository repository;

  // Obs Variables
  @observable
  ObservableStream<List<VagaModel>> vagas;

  @observable
  ObservableStream<List<VagaModel>> vagasDisponiveisStream;

  @observable
  ObservableStream<List<VagaModel>> vagasOcupadasStream;

  // Constructor
  _HomeStoreBase(this.repository) {
    buildStreamDisponiveis();
    buildStreamOcupadas();
    buildStreamAll();
  }

// Methods
  @action
  buildStreamAll() {
    vagas = repository.fecthVagas().asObservable();
  }

  @action
  buildStreamDisponiveis() {
    vagasDisponiveisStream = repository.fecthVagasDisponiveis().asObservable();
  }

  @action
  buildStreamOcupadas() {
    vagasOcupadasStream = repository.fecthVagasOcupadas().asObservable();
  }
}
