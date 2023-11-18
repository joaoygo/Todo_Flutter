import 'package:flutter/material.dart';
import 'package:prova_flutter/features/list_tasks/list_tasks_page.dart';
import 'package:prova_flutter/features/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xff44BD6E),
          selectionColor: Color(0xff44BD6E),
          selectionHandleColor: Color(0xff44BD6E),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/list_tasks': (context) => const ListTasksPage()
      },
    );
  }
}
