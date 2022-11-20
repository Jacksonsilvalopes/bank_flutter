import 'package:bank/components/editor.dart';
import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:provider/provider.dart';

import '../../models/saldo.dart';

const _tituloAppBar = "Receber Deposito";
const _rotuloCampoValor = 'Valor R\$';
const _dicaCampoValor = "1000.0";
const _textoBotao =  "Confirmar";
const _sucess = "Deposito Executado com Sucesso!";


class DepositoComponent extends StatelessWidget {
  DepositoComponent({Key? key}) : super(key: key);




  final TextEditingController _valorController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          _tituloAppBar,
        ),
        // backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              ImputForms(
                imputado: _valorController,
                rotulo: _rotuloCampoValor,
                modelo: _dicaCampoValor,
                icone: Icons.monetization_on,
                keybords: 1,
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  ),
                  onPressed: () {


                    final double valor =double.parse(_valorController.text);
                    final valorValido = _validaDeposito(valor);

                    if(valorValido) {
                      _atualizaEstado(context, valor);
                      Navigator.pop(context);
                    }

                    //  saldo.addSaldo(double.parse(_valorController.text));



                      AnimatedSnackBar.material(
                        _sucess ,
                        type: AnimatedSnackBarType.success,
                        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                        desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
                        duration: const Duration(milliseconds: 100),
                      ).show(context);
                      // ignore: empty_catches
                    } ,


                  child: const Text(_textoBotao),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  _validaDeposito(valor){
    final _input = valor != null;
    return _input;
  }

  //Acessando saldo atraves do provider
  _atualizaEstado(context, valor){
    Provider.of<Saldo>(context, listen: false).addSaldo(valor);
  }
}