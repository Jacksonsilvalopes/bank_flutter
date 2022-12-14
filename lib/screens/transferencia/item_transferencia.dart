import 'package:bank/models/transferencia.dart';
import 'package:flutter/material.dart';

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;


  const ItemTransferencia(this._transferencia, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: const Icon(Icons.monetization_on),
          title: Text('Valor: ${_transferencia.valor.toString()}'),
          subtitle: Text(
            'Conta: ${_transferencia.n_conta.toString()}',
          ),
        ));
  }
}