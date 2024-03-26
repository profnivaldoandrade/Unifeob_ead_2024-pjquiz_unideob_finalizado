import 'package:flutter/material.dart';
import './resulto_final.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var proximapergunta = 0;
  var pontuacaoTotal = 0;

  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Pergunta 01 ?',
      'respostas': [
        {'textoR': 'RESP 1.1', 'valor': '10'},
        {'textoR': 'RESP 1.2', 'valor': '0'},
        {'textoR': 'RESP 1.3', 'valor': '0'},
      ]
    },
    {
      'texto': 'Pergunta 02 ?',
      'respostas': [
        {'textoR': 'RESP 2.1', 'valor': '0'},
        {'textoR': 'RESP 2.2', 'valor': '10'},
        {'textoR': 'RESP 2.3', 'valor': '0'},
      ]
    },
    {
      'texto': 'Pergunta 03 ?',
      'respostas': [
        {'textoR': 'RESP 3.1', 'valor': '10'},
        {'textoR': 'RESP 3.2', 'valor': '0'},
      ]
    },
    {
      'texto': 'Pergunta 04 ?',
      'respostas': [
        {'textoR': 'RESP 4.1', 'valor': '0'},
        {'textoR': 'RESP 4.2', 'valor': '0'},
        {'textoR': 'RESP 4.3', 'valor': '10'},
      ]
    },
  ];

  void reiniciarJogo() {
    setState(() {
      proximapergunta = 0;
      pontuacaoTotal = 0;
    });
  }

  void responder(int valor) {
    setState(() {
      proximapergunta++;
      pontuacaoTotal += valor;
    });
  }

  bool get temPergunta {
    return proximapergunta < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPergunta
        ? perguntas[proximapergunta]['respostas'] as List<Map<String, Object>>
        : [];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 49, 84),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            centerTitle: true,
            title: const Text(
              'Unifeob',
              style: TextStyle(fontSize: 30),
            ),
          ),
          body: temPergunta
              ? Column(
                  children: [
                    Questao(perguntas[proximapergunta]['texto'] as String),
                    ...respostas.map((resp) {
                      return Resposta(
                        resp['textoR'] as String,
                        () => responder(int.parse(resp['valor'].toString())),
                      );
                    }).toList(),
                  ],
                )
              : ResultadoFinal(pontuacaoTotal, reiniciarJogo)),
    );
  }
}
