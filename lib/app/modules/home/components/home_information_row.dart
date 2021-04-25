import 'package:desafio_raro/app/modules/home/home_store.dart';
import 'package:desafio_raro/app/shared/components/information_card.dart';
import 'package:desafio_raro/app/shared/models/vaga_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InformationRow extends StatefulWidget {
  @override
  _InformationRowState createState() => _InformationRowState();
}

class _InformationRowState extends ModularState<InformationRow, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Observer(
            builder: (_) {
              // List Error
              if (controller.vagasOcupadasStream.hasError) {
                return InformationCard(
                  title: 'Veículos no Pátio',
                  value: '',
                );
              }
              // List Null
              if (controller.vagasOcupadasStream.data == null) {
                return InformationCard(
                  title: 'Veículos no Pátio',
                  value: '',
                );
              }

              List<VagaModel> quantVagasOcupadas =
                  controller.vagasOcupadasStream.data;

              return InformationCard(
                  title: 'Veículos no Pátio',
                  value: quantVagasOcupadas.length.toString() ?? "");
            },
          ),
          Observer(
            builder: (_) {
              // List Error
              if (controller.vagasDisponiveisStream.hasError) {
                return InformationCard(
                  title: 'Veículos na Rua',
                  value: '',
                );
              }
              // List Null
              if (controller.vagasDisponiveisStream.data == null) {
                return InformationCard(
                  title: 'Veículos na Rua',
                  value: '',
                );
              }

              List<VagaModel> quantVagasDisponiveis =
                  controller.vagasDisponiveisStream.data;

              return InformationCard(
                  title: 'Veículos na Rua',
                  value: quantVagasDisponiveis.length.toString() ?? "");
            },
          ),
          Observer(
            builder: (_) {
              // List Error
              if (controller.vagasDisponiveisStream.hasError) {
                return InformationCard(
                  title: 'Vagas Vazias',
                  value: '',
                );
              }
              // List Null
              if (controller.vagasDisponiveisStream.data == null) {
                return InformationCard(
                  title: 'Vagas Vazias',
                  value: '',
                );
              }

              List<VagaModel> quantVagasDisponiveis =
                  controller.vagasDisponiveisStream.data;

              return InformationCard(
                  title: 'Vagas Vazias',
                  value: quantVagasDisponiveis.length.toString() ?? "");
            },
          ),
        ],
      ),
    );
  }
}
