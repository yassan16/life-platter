import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:life_platter/routing/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ja_JP', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: Routing().router);
  }
}
