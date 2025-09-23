import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (index) {
          // Tapしたときに、対応するBranchに切り替える
          widget.navigationShell.goBranch(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list),
            label: 'Features',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapbox'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Spare'),
        ],
      ),
    );
  }
}
