import 'package:flutter/material.dart';

class ImputForms extends StatelessWidget {
  final TextEditingController? imputado;
  final String? rotulo;
  final String? modelo;
  final IconData? icone;
  final int? keybords;

  const ImputForms({super.key,
    this.imputado,
    this.rotulo,
    this.modelo,
    this.icone,
    this.keybords,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: imputado,
        style: const TextStyle(fontSize: 24.0),
        keyboardType: keybords == 1?TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(icone, color: Colors.indigo[900]),
          labelText: rotulo,
          hintText: modelo,
        ),
      ),
    );
  }
}