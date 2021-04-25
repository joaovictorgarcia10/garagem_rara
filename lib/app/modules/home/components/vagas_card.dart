import 'package:desafio_raro/app/shared/models/vaga_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class VagasCard extends StatelessWidget {
  final VagaModel model;

  const VagasCard({this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Modular.to.pushNamed(
            '/detail',
            arguments: {'vaga': model},
          );
        },
        child: Container(
          height: 120,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black87,
                offset: Offset(4, 6),
                blurRadius: 4,
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 75,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${model.nome}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 30.0, left: 14.0, right: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            model.disponivel == true ? "Último" : "Atual",
                          ),
                          Text(
                            'Caminhão',
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            model.disponivel == true
                                ? '${model.historico}'
                                : '${model.caminhao}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Disponível',
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            model.disponivel == true ? 'Sim' : 'Não',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            model.disponivel == true ? "Saída" : "Entrada",
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            model.disponivel == true
                                ? '${model.horaSaida}'
                                : '${model.horaEntrada}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
