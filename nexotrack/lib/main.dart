import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nexotrack/Provider/ApiPro.dart';
import 'package:nexotrack/Provider/FunctionsPro.dart';
import 'package:nexotrack/Screnes/Splash.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  final path = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(path.path);
  await Hive.openBox("mycoin");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CryptoPro()),
        ChangeNotifierProvider(create: (_) => FuncPro()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SpalshScr());
  }
}
