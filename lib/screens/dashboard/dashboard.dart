import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/saldo.dart';
import '../deposito/deposito_component.dart';
import '../transferencia/formulario.dart';
import '../transferencia/lista.dart';
import '../transferencia/ultimas.dart';
import 'saldo_component.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shape = const CircularNotchedRectangle();

    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text.rich(textSpan()),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.account_balance,
              color: Colors.white,
              size: 28,
            ),
          )
        ]),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Align(
                alignment: Alignment.topCenter,
                child: SaldoComponent(),
              ),
           /*   Consumer<Saldo>(
                builder: (context, saldo, child) {
                  return ElevatedButton(
                      onPressed: () {
                        saldo.addSaldo(35);
                      },
                      child: const Text('Adicionar'));
                },
              ),
              Consumer<Saldo>(
                builder: (context, saldo, child) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DepositoComponent();
                        }));
                      },
                      child: const Text('Despositar'));
                },
              ),*/
              Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: UltimasTransferencias(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 130,
        child: BottomNavigationBar(
          iconSize: 36,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DepositoComponent();
                    }));
                  },
                  icon: Icon(Icons.monetization_on)),
              label: 'CREDITAR',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (contex){
                      return FormularioTrasferencia();
                    }));
                  },
                  icon: const Icon(
                    Icons.monetization_on,
                    size: 36,
                  )),
              label: 'TRANSFERIR',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return ListaTransferencia();
                    }
                    ),);
                  }, icon: Icon(Icons.arrow_upward_outlined)),
              label: 'VER TODAS',
            ),

          ],
        ),
      ),
    );
  }

  InlineSpan textSpan() {
    return const TextSpan(style: TextStyle(fontSize: 28), children: [
      TextSpan(
          text: 'Byte',
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
      TextSpan(text: 'Bank', style: TextStyle(color: Colors.white)),
    ]);
  }
}
