import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_platter/common/theme/app_colors.dart';

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
        type: BottomNavigationBarType.fixed, // アニメーション無効
        selectedItemColor: AppColors.appBarColor,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'カレンダー',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: '料理リスト'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: '追加'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'グラフ'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'その他'),
        ],
      ),
    );
  }
}
