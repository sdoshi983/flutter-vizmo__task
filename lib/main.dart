import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vizmo_task/providers/main_provider.dart';
import 'package:vizmo_task/route_generator.dart';
import 'package:vizmo_task/view/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,  // Informing our material app to use this (Route Generator) class for routing
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Dashboard()
      ),
    );
  }
}

