import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/transacao_tranferencias.dart';

import 'item_transferencia.dart';
import 'lista.dart';

const _titulo = 'Últimas transferências';
bool view = false;

class UltimasTransferencias extends StatelessWidget {
  const UltimasTransferencias({super.key});

  Widget build(BuildContext context) {
    return Column(

      children: [
        const GetTitulo(),

        Consumer<TransacaoTransferencias>(
          builder: (context, transferencias, child) {
            final ultimasTransferencias =
                transferencias.tranfrencias.reversed.toList();
            final quantidade = transferencias.tranfrencias.length;
            int taxman;
            if (quantidade < 4) {
              taxman = quantidade;

            } else {
              taxman = 4;

            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: taxman,
              itemBuilder: (context, indice) {
                final _transferencia = ultimasTransferencias[indice];
                return ItemTransferencia(_transferencia);
              },
            );
          },
        ),
      ],
    );
  }

}

class GetTitulo extends StatelessWidget {
  const GetTitulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Text(
      _titulo,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
