import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_web_page/providers/page_provider.dart';
import 'package:vertical_landing_web_page/ui/pages/home_page.dart';

// creamos nuestros handlers segun el nombre que hayamos colocado en cada pagina
final homeHandler = Handler(handlerFunc: (context, params) {
  // se condiciona para no redibujar la ruta dos veces y evitar el error
  // "ScrollController attached to multiple scroll views."
  final page = params['page']!.first;
  if (page != '/') {
    final pageProvider = Provider.of<PageProvider>(context!, listen: false);
    pageProvider.createScrollController(page);
    return const HomePage();
  } else {
    return null;
  }
});
