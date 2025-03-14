import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<StatefulWidget> createState() => _Calculadora();
}

class _Calculadora extends State<Calculadora> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _resultado = '';

  void _somar() {
    final num1 = double.tryParse(_controller1.text);
    final num2 = double.tryParse(_controller2.text);

    setState(() {
      if (num1 != null && num2 != null) {
        double subtracao = num1 + num2;
        _resultado = ("O resultado da Soma é $subtracao").toString();
      } else {
        _resultado = "Não foi possível realizar o cálculo";
      }
    });
  }

  void _subtrair() {
    final num1 = double.tryParse(_controller1.text);
    final num2 = double.tryParse(_controller2.text);

    setState(() {
      if (num1 != null && num2 != null) {
        double subtracao = num1 - num2;
        _resultado = ("O resultado da Subtração é $subtracao").toString();
      } else {
        _resultado = "Não foi possível realizar o cálculo";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),

      home: Scaffold(
        appBar: AppBar(title: Text('Calculadora')),

        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controller1,
                decoration: InputDecoration(
                  labelText: 'Digite o primeiro número:',
                ),
              ),

              TextField(
                controller: _controller2,
                decoration: InputDecoration(
                  labelText: 'Digite o segundo número:',
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: _somar,
                    child: Text('+')
                  ),
                  SizedBox(
                    width: 20
                  ),
                  FilledButton(
                    onPressed: _subtrair,
                    child: Text('-')
                  ),
                ],
              ),

              TextField(
                controller: TextEditingController(text: _resultado),
                readOnly: true,
                decoration: InputDecoration(labelText: 'Resultado'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
