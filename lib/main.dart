import 'package:flutter/material.dart';
import 'package:teste_notifier/utils/inject/inject.dart';
import 'package:teste_notifier/utils/navigator/routes.dart';
import 'package:teste_notifier/utils/strings.dart';

void main() {
  Inject.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Inject.get<GlobalKey<NavigatorState>>(),
      title: Strings.estudoImplementacaoDoPageView.text,
      initialRoute: Routes.cadastroVeiculoCubit.route,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        final builder = Routes.routes[settings.name]!;

        return MaterialPageRoute(builder: builder, settings: settings);
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
