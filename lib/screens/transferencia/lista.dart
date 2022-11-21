
import 'package:bank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/transacao_tranferencias.dart';
import 'item_transferencia.dart';

class ListaTransferencia extends StatefulWidget {
  const ListaTransferencia({super.key});

  @override
  State<ListaTransferencia> createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
   final trans = _getTransferencia(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transferencias",
        ),
        //  backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: trans.length,
        itemBuilder: (context, indice) {
          final trasferenciaOne = trans[indice];
          return ItemTransferencia(trasferenciaOne);
        },
      ),
   /* return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transferencias",
        ),
        //  backgroundColor: Colors.green,
      ),
      body: Consumer<TransacaoTransferencias>(
        builder:(context, transferencias,child){
          return  ListView.builder(
          itemCount: transferencias.tranfrencias.length,
          itemBuilder: (context, indice) {
          final trasferenciaOne = transferencias.tranfrencias[indice];
          return ItemTransferencia(trasferenciaOne);
          },
          );
        } ,

      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          final Future future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTrasferencia();
          }));

          future.then((transferenciaRecebida) {
            setState(() {

            });
          });
        },
        //  backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
 _getTransferencia(context) {
    final trans = Provider.of<TransacaoTransferencias>(context, listen: false)
        .tranfrencias;
    return trans;
  }
}

