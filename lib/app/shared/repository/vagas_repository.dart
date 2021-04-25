import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_raro/app/shared/models/vaga_model.dart';
import 'package:desafio_raro/app/shared/repository/vagas_repository_interface.dart';

class VagasRepository implements IVagasRepository {
  final Firestore _firestore;

  VagasRepository(this._firestore);

  @override
  Stream<List<VagaModel>> fecthVagas() {
    var vagas = _firestore.collection('vaga').orderBy('position').snapshots();

    return vagas.map(
      (query) {
        return query.documents
            .map((doc) => VagaModel.fromDocument(doc))
            .toList();
      },
    );
  }

  Stream<List<VagaModel>> fecthVagasDisponiveis() {
    var disp = _firestore
        .collection('vaga')
        .where('disponivel', isEqualTo: true)
        .snapshots();

    return disp.map(
      (query) {
        return query.documents
            .map((doc) => VagaModel.fromDocument(doc))
            .toList();
      },
    );
  }

  Stream<List<VagaModel>> fecthVagasOcupadas() {
    var indisp = _firestore
        .collection('vaga')
        .where('disponivel', isEqualTo: false)
        .snapshots();

    return indisp.map(
      (query) {
        return query.documents
            .map((doc) => VagaModel.fromDocument(doc))
            .toList();
      },
    );
  }
}
