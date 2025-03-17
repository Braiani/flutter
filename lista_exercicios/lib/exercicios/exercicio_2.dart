import 'package:flutter/material.dart';

class Exercicio2 extends StatefulWidget{
  const Exercicio2({super.key});

  @override
  Exercicio2State createState() => Exercicio2State();

}

class Exercicio2State extends State<Exercicio2>{
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';

  void _calcularJuros() {
    final _deposito = double.tryParse(_controller.text);

    setState(() {
      if(_deposito == null){
        _resultado = 'Valor digitado inválido!';
        return;
      }

      var calculo = (_deposito * 1.05).toString();
      
      _resultado = "O valor total, após 01 mês de rendimento, será de R\$ $calculo";
    });
  }

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

          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Digite o valor depositado: (R\$)',
            ),
          ),

          SizedBox(height: 50),

          FilledButton(
            onPressed: _calcularJuros,
            child: Text('Calcular Rendimento'),
          ),

          SizedBox(height: 50),

          Text(
            _resultado,
            style: TextStyle(
              fontSize: 16
            ),
          )
        ],
      ),
    );
  }

}