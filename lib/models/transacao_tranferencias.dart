import 'package:bank/models/transferencia.dart';
import 'package:flutter/material.dart';

class TransacaoTransferencias extends ChangeNotifier {
  final List<Transferencia> _tranfrencias = [];

  List<Transferencia> get tranfrencias => _tranfrencias;

  addTransferencia(Transferencia novaTransferencia){
    tranfrencias.add(novaTransferencia);
  }


}
