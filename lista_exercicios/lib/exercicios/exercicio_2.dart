import 'package:flutter/material.dart';

class Exercicio2 extends StatefulWidget{
  const Exercicio2({super.key});

  @override
  Exercicio2State createState() => Exercicio2State();

}

class Exercicio2State extends State<Exercicio2>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Calculadora de Juros da Poupança!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          
          SizedBox(height: 50),

          /* TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Digite a medida em metros:',
            ),
          ), */

          SizedBox(height: 50),

          /* FilledButton(
            onPressed: _converter,
            child: Text('Converter'),
          ), */

          SizedBox(height: 50),

          /* Text(
            _resultado,
            style: TextStyle(
              fontSize: 16
            ),
          ) */
        ],
      ),
    );
  }

}