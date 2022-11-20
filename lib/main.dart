

import 'package:bank/models/saldo.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'screens/dashboard/dashboard.dart';


void main() {
  runApp(ChangeNotifierProvider (
    create: (context) => Saldo(0),
    child: const ByteBankApp(),
  ));
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: const Dashboard(),
    );
  }
}
