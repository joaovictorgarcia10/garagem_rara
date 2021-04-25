import 'package:desafio_raro/app/modules/detail/components/detail_information_row.dart';
import 'package:desafio_raro/app/modules/detail/detail_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:desafio_raro/app/shared/models/vaga_model.dart';

class DetailPage extends StatefulWidget {
  final VagaModel vagaDetail;
  final String title;

  DetailPage({
    this.vagaDetail,
    this.title = 'Detalhes',
  });

  @override
  DetailPageState createState() => DetailPageState();
  String novoCaminhao;
}

class DetailPageState extends ModularState<DetailPage, DetailStore> {
  //LOCAL FORM CONTROLLER
  final _formKey = new GlobalKey<FormState>();

  Future<void> onSubmit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    _showDialog(widget.vagaDetail);
  }

  // ALERT DIALOG
  Future _showDialog([VagaModel model]) async {
    model ??= VagaModel();

    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            widget.vagaDetail.disponivel == true
                ? 'Registrar Entrada'
                : 'Registrar Saída',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 15),
              Text(
                widget.vagaDetail.disponivel == true
                    ? 'Caminhão: ${widget.novoCaminhao}'
                    : 'Caminhão: ${widget.vagaDetail.caminhao}',
              ),
              SizedBox(height: 10),
              Text('Vaga: ${widget.vagaDetail.nome}'),
              SizedBox(height: 10),
              Text('Horário:  ${DateFormat('hh:mm').format(DateTime.now())}'),
            ],
          ),
          //
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Não',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                widget.vagaDetail.disponivel == true
                    ? model.registrarEntrada(newCaminhao: widget.novoCaminhao)
                    : model.registrarSaida();

                Modular.to.pop();
                Modular.to.pop();
              },
              child: Text(
                'Sim',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.black26,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black54,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DetailInformationRow(model: widget.vagaDetail),

              // CASO ENTRANDO
              widget.vagaDetail.disponivel == true
                  ? Observer(
                      builder: (_) {
                        // LIST ERROR
                        if (controller.vagasAvailable.hasError) {
                          return Center(
                            child: Column(
                              children: [
                                Text('Houve um Erro Inesperado'),
                                TextButton(
                                  onPressed: () {
                                    controller.buildStreamAvailable();
                                  },
                                  child: Text('Tente Novamente'),
                                ),
                              ],
                            ),
                          );
                        }
                        // LIST NULL
                        if (controller.vagasAvailable.data == null) {
                          return Center(child: CircularProgressIndicator());
                        }
                        // LIST OK
                        List<VagaModel> vagasDisponiveis =
                            controller.vagasAvailable.data;
                        //
                        return Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  labelText: 'Informe o Caminhão',
                                ),
                                items: vagasDisponiveis.map(
                                  (value) {
                                    return DropdownMenuItem<String>(
                                      value: value.caminhao,
                                      child:
                                          Text('Caminhão - ${value.caminhao}'),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) {
                                  widget.novoCaminhao = value;
                                  print(value);
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Escolha um caminhão';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 60.0),
                              Container(
                                height: 50,
                                width: 450,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black87,
                                      offset: Offset(2, 4),
                                      blurRadius: 5,
                                    )
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    onSubmit();
                                  },
                                  child: Text(
                                    'Registrar Entrada',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )

                  //CASO SAINDO
                  : Container(
                      height: 50,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black87,
                            offset: Offset(2, 4),
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          return _showDialog(widget.vagaDetail);
                        },
                        child: Text(
                          'Registrar Saída',
                          style: TextStyle(
                            color: Colors.white,
                          ),
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
