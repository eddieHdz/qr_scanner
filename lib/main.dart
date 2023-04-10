import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UiProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (context) => HomeScreen(),
          'mapa': (context) => MapaScreen()
        },
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)),
      ),
    );
  }
}
