import 'package:bank/models/transferencia.dart';
import 'package:bank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencia = [];

  ListaTransferencia({super.key});
  @override
  State<ListaTransferencia> createState() => ListaTransferenciaState();
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transferencias",
        ),
        //  backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: widget._transferencia.length,
        itemBuilder: (context, indice) {
          final trasferenciaOne = widget._transferencia[indice];
          return ItemTransferencia(trasferenciaOne);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTrasferencia();
          }));

          future.then((transferenciaRecebida) {
            setState(() {
              widget._transferencia.add(transferenciaRecebida);
            });
          });
        },
        //  backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}

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
