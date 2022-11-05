import 'package:bank/components/editor.dart';
import 'package:bank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

const _tituloAppBar = "Nova Transferencias";
const _rotuloCampoValor = 'Valor R\$';
const _dicaCampoValor = "1000.0";
const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCamponumeroConta = "0000-00";
const _textoBotao =  "Confirmar";
const _sucess = 'Transferencia Realizada';

class FormularioTrasferencia extends StatelessWidget {
  FormularioTrasferencia({Key? key}) : super(key: key);

  final TextEditingController _contaController = TextEditingController();
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
                imputado: _contaController,
                rotulo: _rotuloCampoNumeroConta,
                modelo: _dicaCamponumeroConta,
                icone: Icons.account_balance,
                keybords: 2,
              ),
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
                    try {
                      final trans = Transferencia(
                          double.parse(_valorController.text),
                          _contaController.text);

                      //enviando dados recebidos
                      Navigator.pop(context, trans);

                      AnimatedSnackBar.material(
                        _sucess ,
                        type: AnimatedSnackBarType.success,
                        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                        desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
                        duration: const Duration(milliseconds: 100),
                      ).show(context);
                    // ignore: empty_catches
                    } catch (e) { }

                  },
                  child: const Text(_textoBotao),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}