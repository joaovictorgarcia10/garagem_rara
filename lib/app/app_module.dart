import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_raro/app/modules/detail/detail_module.dart';
import 'package:desafio_raro/app/modules/home/home_store.dart';
import 'package:desafio_raro/app/shared/repository/vagas_repository.dart';
import 'package:desafio_raro/app/shared/repository/vagas_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/detail/detail_store.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore(i.get())),
    Bind((i) => DetailStore(i.get())),
    Bind<IVagasRepository>((i) => VagasRepository(Firestore.instance)),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/detail', module: DetailModule()),
  ];
}
