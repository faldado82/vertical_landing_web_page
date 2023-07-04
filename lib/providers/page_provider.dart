import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
  }

  
  //obtengo en index de la pagina...
  // si no existe sera -1 entonces devuelvo el index 0...
  // sino retornare el index de la pagina solicitada
  int getPageIndex(String routeName) {
    return !_pages.contains(routeName) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    //final routeName = _pages[index];
    html.window.history.pushState(null, '', '#/${_pages[index]} ');

    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
