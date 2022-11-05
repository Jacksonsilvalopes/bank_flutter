
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