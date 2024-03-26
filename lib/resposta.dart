import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String textobtn;
  final void Function() quandoResponder;

  const Resposta(this.textobtn, this.quandoResponder, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(5),
          backgroundColor: const Color.fromARGB(255, 253, 197, 7),
          foregroundColor: const Color.fromARGB(255, 0, 49, 84),
        ),
        onPressed: quandoResponder,
        child: Text(textobtn),
      ),
    );
  }
}
