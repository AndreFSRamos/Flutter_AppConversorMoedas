import 'package:flutter/material.dart';

//Widget  do tipo que build que recebe como parametrô String 'Nome da Moeda',
//String 'Simbolo da moeda', Controller 'Controller da moeda em questão' e
//uma função 'Função privada da moeda em questão.
class TextConvet extends StatelessWidget {
  const TextConvet({
    Key? key,
    required this.nome,
    required this.simbolo,
    required this.acao,
    required this.controller,
  }) : super(key: key);

  final String nome;
  final String simbolo;
  final Function(String) acao;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.end,
      onChanged: acao,
      controller: controller,
      decoration: InputDecoration(
        labelText: nome,
        labelStyle: const TextStyle(color: Colors.amber),
        border: const OutlineInputBorder(),
        prefixText: simbolo,
      ),
      style: const TextStyle(color: Colors.amber, fontSize: 25.0),
      keyboardType: const TextInputType.numberWithOptions(decimal: false),
    );
  }
}
