import 'package:fluro/fluro.dart';
import 'package:vertical_landing_web_page/ui/pages/home_page.dart';

// creamos nuestros handlers segun el nombre que hayamos colocado en cada pagina
final homeHandler = Handler(handlerFunc: (context, params) {
  return const HomePage();
});
