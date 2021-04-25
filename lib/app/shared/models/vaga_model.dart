import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class VagaModel {
  String nome;
  bool disponivel;
  String caminhao;
  String horaEntrada;
  String horaSaida;
  String historico;
  DocumentReference documentReference;

  VagaModel({
    this.nome = "",
    this.disponivel = false,
    this.caminhao = "",
    this.horaEntrada = "",
    this.horaSaida = "",
    this.historico = "",
    this.documentReference,
  });

  factory VagaModel.fromDocument(DocumentSnapshot doc) {
    return VagaModel(
      nome: doc['nome'],
      disponivel: doc['disponivel'],
      caminhao: doc['caminhao'],
      horaEntrada: doc['horaEntrada'],
      horaSaida: doc['horaSaida'],
      historico: doc['historico'],
      documentReference: doc.reference,
    );
  }

  registrarEntrada({String newCaminhao}) {
    return documentReference.updateData({
      'disponivel': false,
      'caminhao': newCaminhao,
      'horaEntrada': DateFormat('hh:mm').format(DateTime.now()),
      'horaSaida': '',
      'historico': ''
    });
  }

  registrarSaida() {
    return documentReference.updateData({
      'disponivel': true,
      'horaSaida': DateFormat('hh:mm').format(DateTime.now()),
      'historico': caminhao,
    });
  }
}
