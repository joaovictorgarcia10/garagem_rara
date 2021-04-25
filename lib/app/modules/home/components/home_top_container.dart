import 'package:desafio_raro/app/modules/home/components/home_information_row.dart';
import 'package:desafio_raro/app/modules/home/home_store.dart';
import 'package:desafio_raro/app/shared/models/vaga_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class TopContainer extends StatefulWidget {
  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends ModularState<TopContainer, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Column(
        children: [
          SizedBox(height: 25.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('lib/assets/icons/truck-icon.png'),
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
                SizedBox(height: 25.0),
                Text(
                  'Garagem Rara',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.0),
                Observer(
                  builder: (_) {
                    // List Error
                    if (controller.vagas.hasError) {
                      return Text(
                        'Total: 0 Veículos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                    // List Null
                    if (controller.vagas.data == null) {
                      return Text(
                        'Total: 0 Veículos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                    // List Ok
                    List<VagaModel> totalVagas = controller.vagas.data;
                    return Text(
                      'Total: ${totalVagas.length.toString()} Veículos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 50.0),
          InformationRow(),
        ],
      ),
    );
  }
}
