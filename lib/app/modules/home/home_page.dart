import 'package:desafio_raro/app/modules/home/components/home_top_container.dart';
import 'package:desafio_raro/app/modules/home/components/vagas_card.dart';
import 'package:desafio_raro/app/modules/home/home_store.dart';
import 'package:desafio_raro/app/shared/models/vaga_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title = 'Home'});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black54,
                elevation: 10.0,
                expandedHeight: 550.0,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Hero(
                    tag: 'sliverppBar',
                    child: TopContainer(),
                  ),
                ),
              ),
            ];
          },
          body: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black26,
                elevation: 0,
                title: Text(
                  'Vagas',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                //
                bottom: TabBar(
                  tabs: [
                    Tab(text: "Ocupadas"),
                    Tab(text: "Vazias"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  //Tab1
                  Observer(
                    builder: (_) {
                      // List Error
                      if (controller.vagasOcupadasStream.hasError) {
                        return Center(
                          child: TextButton(
                            onPressed: controller.buildStreamOcupadas(),
                            child: Center(
                              child: Column(
                                children: [
                                  Text('Houve um Erro Inesperado'),
                                  TextButton(
                                    onPressed: () {
                                      controller.buildStreamOcupadas();
                                    },
                                    child: Text('Tente Novamente'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      // List Null
                      if (controller.vagasOcupadasStream.data == null) {
                        return Container(
                          child: Center(
                            child: Text('Lista Vazia'),
                          ),
                        );
                      }
                      // List Ok
                      List<VagaModel> vagasOcupadas =
                          controller.vagasOcupadasStream.data;
                      return Container(
                        color: Colors.black26,
                        padding: EdgeInsets.all(5.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: vagasOcupadas.length,
                          itemBuilder: (_, index) {
                            var model = vagasOcupadas[index];
                            return VagasCard(model: model);
                          },
                        ),
                      );
                    },
                  ),
                  //Tab2
                  Observer(
                    builder: (_) {
                      // List Error
                      if (controller.vagasDisponiveisStream.hasError) {
                        return Center(
                          child: TextButton(
                            onPressed: controller.buildStreamDisponiveis(),
                            child: Center(
                              child: Column(
                                children: [
                                  Text('Houve um Erro Inesperado'),
                                  TextButton(
                                    onPressed: () {
                                      controller.vagasDisponiveisStream;
                                    },
                                    child: Text('Tente Novamente'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      // List Null
                      if (controller.vagasDisponiveisStream.data == null) {
                        return Container(
                          child: Center(
                            child: Text('Lista Vazia'),
                          ),
                        );
                      }
                      // List Ok
                      List<VagaModel> vagasDisponiveis =
                          controller.vagasDisponiveisStream.data;
                      return Container(
                        color: Colors.black26,
                        padding: EdgeInsets.all(5.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: vagasDisponiveis.length,
                          itemBuilder: (_, index) {
                            var model = vagasDisponiveis[index];
                            return VagasCard(model: model);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
