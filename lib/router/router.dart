import 'package:fluro/fluro.dart';
import 'package:vertical_landing_web_page/router/router_handlers.dart';

// 1) descargamos el paquete Fluro en pubspec.yaml
// 2) creamos nuestra clase Flurorouter e importamos el paquete
class Flurorouter {
  // 3)instanciamos el router
  static final FluroRouter router = FluroRouter();

  // 4) generamos y configuramos las rutas

  static void configureRoutes() {
    // Rutas
    // 5) en router_handlers.dart creamos los manejadores (handler:)
    router.define('/:page', handler: homeHandler);
    // 404 - Page not found
    // en este caso mostrare el home en caso de la ruta no exista
    router.notFoundHandler = homeHandler;
  }
}
