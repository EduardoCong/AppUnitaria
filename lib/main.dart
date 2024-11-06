import 'package:appunificada/providers/model_menu_provider.dart';
import 'package:appunificada/providers/tasks_provider.dart';
import 'package:appunificada/providers/tips_provider.dart';
import 'package:appunificada/screens/menuNavigator/menu_navigator_screen.dart';
import 'package:appunificada/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp()
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_) => TipsProvider()),
       ChangeNotifierProvider(create: (_) => TaskProvider()),
       ChangeNotifierProvider(create: (_) => MenuNavigatorModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme(selectedColor: 1).theme(),
        home: const MenuScreen(),
      ),
    );
  }
}