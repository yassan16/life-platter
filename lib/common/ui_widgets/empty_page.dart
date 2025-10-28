import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String title;
  const EmptyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$title ページ（準備中）', style: const TextStyle(fontSize: 18)),
    );
  }
}
