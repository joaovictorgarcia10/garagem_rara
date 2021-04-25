// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$vagasAtom = Atom(name: '_HomeStoreBase.vagas');

  @override
  ObservableStream<List<VagaModel>> get vagas {
    _$vagasAtom.reportRead();
    return super.vagas;
  }

  @override
  set vagas(ObservableStream<List<VagaModel>> value) {
    _$vagasAtom.reportWrite(value, super.vagas, () {
      super.vagas = value;
    });
  }

  final _$vagasDisponiveisStreamAtom =
      Atom(name: '_HomeStoreBase.vagasDisponiveisStream');

  @override
  ObservableStream<List<VagaModel>> get vagasDisponiveisStream {
    _$vagasDisponiveisStreamAtom.reportRead();
    return super.vagasDisponiveisStream;
  }

  @override
  set vagasDisponiveisStream(ObservableStream<List<VagaModel>> value) {
    _$vagasDisponiveisStreamAtom
        .reportWrite(value, super.vagasDisponiveisStream, () {
      super.vagasDisponiveisStream = value;
    });
  }

  final _$vagasOcupadasStreamAtom =
      Atom(name: '_HomeStoreBase.vagasOcupadasStream');

  @override
  ObservableStream<List<VagaModel>> get vagasOcupadasStream {
    _$vagasOcupadasStreamAtom.reportRead();
    return super.vagasOcupadasStream;
  }

  @override
  set vagasOcupadasStream(ObservableStream<List<VagaModel>> value) {
    _$vagasOcupadasStreamAtom.reportWrite(value, super.vagasOcupadasStream, () {
      super.vagasOcupadasStream = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic buildStreamAll() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.buildStreamAll');
    try {
      return super.buildStreamAll();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic buildStreamDisponiveis() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.buildStreamDisponiveis');
    try {
      return super.buildStreamDisponiveis();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic buildStreamOcupadas() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.buildStreamOcupadas');
    try {
      return super.buildStreamOcupadas();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
vagas: ${vagas},
vagasDisponiveisStream: ${vagasDisponiveisStream},
vagasOcupadasStream: ${vagasOcupadasStream}
    ''';
  }
}
