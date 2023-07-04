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

  int _currentIndex = 0;

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
    html.document.title =
        'Landing Web Page: ${capitalize(_pages[_currentIndex])}';
    scrollController.addListener(() {
      final index = (scrollController.page ?? 0).round;

      if (index() != _currentIndex) {
        html.window.history.pushState(null, '', '#/${_pages[index()]} ');
        _currentIndex = index();
        html.document.title =
            'Landing Web Page: ${capitalize(_pages[_currentIndex])}';
      }
    });
  }

  String capitalize(String value) {
    return value.substring(0, 1).toUpperCase() + value.substring(1);
  }

  //obtengo en index de la pagina...
  // si no existe sera -1 entonces devuelvo el index 0...
  // sino retornare el index de la pagina solicitada
  int getPageIndex(String routeName) {
    return !_pages.contains(routeName) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
