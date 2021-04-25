import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desafio_raro/app/modules/home/home_store.dart';
import 'package:desafio_raro/app/modules/home/home_module.dart';

void main() {
  initModule(HomeModule());
  // HomeStore home;
  //
  setUp(() {
    //     home = HomeModule.to.get<HomeStore>();
  });

  group('HomeStore Test', () {
    //   test("First Test", () {
    //     expect(home, isInstanceOf<HomeStore>());
    //   });

    //   test("Set Value", () {
    //     expect(home.value, equals(0));
    //     home.increment();
    //     expect(home.value, equals(1));
    //   });
  });
}
