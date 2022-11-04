import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

void main() {
  runApp(const ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormularioTrasferencia(),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transferencias",
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, '5874-22')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
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
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(
        _transferencia.n_conta.toString(),
      ),
    ));
  }
}

class Transferencia {
  final double valor;
  // ignore: non_constant_identifier_names
  final String n_conta;

  Transferencia(this.valor, this.n_conta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, n_conta: $n_conta}';
  }
}

class FormularioTrasferencia extends StatelessWidget {
  FormularioTrasferencia({Key? key}) : super(key: key);

  final TextEditingController _contaController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nova Transferencias",
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ImputForms(
              imputado: _contaController,
              rotulo: 'Número da Conta',
              modelo: "0000-00",
              icone: Icons.account_balance,
            ),
            ImputForms(
              imputado: _contaController,
              rotulo: 'Valor R\$',
              modelo: "1000.0",
              icone: Icons.account_balance,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  try {

                    final trans = Transferencia(
                        double.parse(_valorController.text),
                        _contaController.text);
                    debugPrint('$trans');

                    AnimatedSnackBar.material(
                      'Transferencia Realizada',
                      type: AnimatedSnackBarType.success,
                      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                      desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
                      duration: const Duration(milliseconds: 50),
                    ).show(context);
                  } catch (e) { }
                },
                child: const Text("Confirmar"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImputForms extends StatelessWidget {
  final TextEditingController? imputado;
  final String? rotulo;
  final String? modelo;
  final IconData? icone;

  const ImputForms({
    this.imputado,
    this.rotulo,
    this.modelo,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: imputado,
        style: TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(icone, color: Colors.lightGreen),
          labelText: rotulo,
          hintText: modelo,
        ),
      ),
    );
  }
}
