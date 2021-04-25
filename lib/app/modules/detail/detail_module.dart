import 'package:desafio_raro/app/modules/detail/detail_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) {
        var parametros = args.data;

        return DetailPage(
          vagaDetail: parametros['vaga'],
          //lista: parametros['lista'],
        );
      },
      transition: TransitionType.fadeIn,
      duration: Duration(milliseconds: 900),
    ),
  ];
}
