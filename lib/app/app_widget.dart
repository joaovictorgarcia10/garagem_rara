import 'package:desafio_raro/app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio Raro',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
    ).modular();
  }
}
