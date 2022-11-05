import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'screens/transferencia/lista.dart';

void main() {
  runApp(const ByteBankApp());
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
    textTheme: GoogleFonts.montserratTextTheme(

    ),

    ),
      home: ListaTransferencia(),
    );
  }
}










