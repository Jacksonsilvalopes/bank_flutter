import 'package:bank/components/editor.dart';
import 'package:bank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:provider/provider.dart';

import '../../models/saldo.dart';
import '../../models/transacao_tranferencias.dart';

const _tituloAppBar = "Nova Transferencias";
const _rotuloCampoValor = 'Valor R\$';
const _dicaCampoValor = "1000.0";
const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCamponumeroConta = "0000-00";
const _textoBotao = "Confirmar";
const _sucess = 'Transferencia Realizada';
const _warnings = 'Saldo Insuficiente';

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

                    final valor = double.parse(_valorController.text);
                    final conta =  _contaController.text;
                    final transferenciaValida = _validaTransferencia(valor,conta);
                    final itsOk =  _verificar(context, valor );

                    if (transferenciaValida && itsOk ) {
                      final novaTransferencia = Transferencia(valor,conta);
                      _atualizaEstadoTrasferencia(context, novaTransferencia, valor);
                      Navigator.pop(context);


                      AnimatedSnackBar.material(
                        _sucess,
                        type: AnimatedSnackBarType.success,
                        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                        desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
                        duration: const Duration(milliseconds: 100),
                      ).show(context);

                    } else if ( itsOk == false || valor.runtimeType != double) {
                      Navigator.pop(context);
                      AnimatedSnackBar.material(
                        _warnings,
                        type: AnimatedSnackBarType.error,
                        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                        desktopSnackBarPosition: DesktopSnackBarPosition
                            .topRight,
                        duration: const Duration(milliseconds: 100),
                      ).show(context);


                    }

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

  _validaTransferencia(conta, valor) {
    final _camposValidos = conta != null && valor != null;
    return _camposValidos;
  }
  _atualizaEstadoTrasferencia(context, novaTransferencia, valor){
    Provider.of<TransacaoTransferencias>(context, listen:false).addTransferencia(novaTransferencia);
    Provider.of<Saldo>(context, listen:false).subtractSaldo(valor);
  }
  _verificar(context, valor ){
   final valorCaixa = Provider.of<Saldo>(context, listen:false).valor;
   if(valorCaixa >= valor ){
     return true;
   }
   return false;
  }
}
