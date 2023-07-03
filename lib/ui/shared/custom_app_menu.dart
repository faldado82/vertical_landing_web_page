import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_landing_web_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 0),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: 150,
            height: isOpen ? 315 : 50,
            color: Colors.black,
            child: Column(
              children: [
                _MenuTitle(isOpen: isOpen, controller: controller),
                if (isOpen) ...[
                  CustomMenuItem(text: 'Home', onPressed: () {}),
                  CustomMenuItem(delay: 50, text: 'About', onPressed: () {}),
                  CustomMenuItem(delay: 100, text: 'Pricing', onPressed: () {}),
                  CustomMenuItem(delay: 150, text: 'Contact', onPressed: () {}),
                  CustomMenuItem(
                      delay: 200, text: 'Location', onPressed: () {}),
                  const SizedBox(height: 15)
                ],
              ],
            )),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    required this.isOpen,
    required this.controller,
  });

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isOpen ? 38 : 0,
          ),
          Text('Menu',
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
