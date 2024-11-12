import 'package:financial/providers/amount_provider.dart';
import 'package:financial/routes/routes.dart';
import 'package:financial/services/localDatabase_service.dart';
import 'package:financial/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().database;
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AmountProvider()),
        ],
        child: MaterialApp(
          title: 'finanacial',
          theme: AppTheme.defaultTheme,
          routes: AppRoutes.getRoutes(),
          initialRoute: AppRoutes.initialRoute,
        ));
  }
}
