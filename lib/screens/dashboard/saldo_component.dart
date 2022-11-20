import 'package:bank/models/saldo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaldoComponent extends StatelessWidget {
  const SaldoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: SizedBox(

        height: 100,
        child: Align(
          alignment: Alignment.center,
          child: Consumer<Saldo>(
           builder: (context, valor, child){
             return  Text(valor.formatterValor());
           },
          ),
        ),
      ),
    );
  }
}
