import 'package:desafio_raro/app/shared/components/information_card.dart';
import 'package:desafio_raro/app/shared/models/vaga_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailInformationRow extends StatelessWidget {
  final VagaModel model;

  const DetailInformationRow({this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Vaga ${model.nome}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat('dd/MM/yyyy').format(DateTime.now()),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          ],
        ),
        SizedBox(height: 40.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InformationCard(
              title: 'Disponível',
              value: model.disponivel == true ? 'Sim' : 'Não',
            ),

            //
            InformationCard(
              title: model.disponivel == true ? 'Último Caminhão' : 'Caminhão',
              value: model.disponivel == true
                  ? '${model.historico}'
                  : '${model.caminhao}',
            ),
            //

            InformationCard(
              title: model.disponivel == true ? 'Saída' : 'Entrada',
              value: model.disponivel == true
                  ? '${model.horaSaida}'
                  : '${model.horaEntrada}',
            ),
          ],
        ),
        SizedBox(height: 100.0),
      ],
    );
  }
}
