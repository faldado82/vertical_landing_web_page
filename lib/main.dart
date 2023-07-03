import 'package:flutter/material.dart';
import 'package:vertical_landing_web_page/router/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Flurorouter.configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing Web Page', // titulo de la web
      initialRoute: '/home', // ruta de inicio
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
