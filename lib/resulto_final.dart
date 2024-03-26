import 'package:flutter/material.dart';

class ResultadoFinal extends StatelessWidget {
  final int pontuacao;
  final Function() quandoReinicar;

  const ResultadoFinal(this.pontuacao, this.quandoReinicar, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Parabéns pela sua Participação',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Sua Pontuação foi de ${pontuacao.toString()} pontos',
            style: const TextStyle(fontSize: 24),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(5),
                backgroundColor: const Color.fromARGB(255, 253, 197, 7),
                foregroundColor: const Color.fromARGB(255, 0, 49, 84),
              ),
              onPressed: quandoReinicar,
              child: const Text('Reiniciar'),
            ),
          )
        ],
      ),
    );
  }
}
