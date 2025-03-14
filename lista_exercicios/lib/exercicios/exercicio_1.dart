import 'package:flutter/material.dart';

class Exercicio1 extends StatefulWidget{
  const Exercicio1({super.key});

  @override
  Exercicio1State createState() => Exercicio1State();

}

class Exercicio1State extends State<Exercicio1>{
  TextEditingController _controller = TextEditingController();
  String _resultado = '';

  void _converter() {
    final _metros = double.tryParse(_controller.text);

      setState(() {
        if (_metros != null){
          var _conversao = (_metros * 100).toString();

          _resultado = "$_metros metros são $_conversao centímetros, quando convertidos.";
        }else{
          _resultado = 'Não foi possível realizar a conversão.';
        }
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
            'Conversor de metros para centímetros!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          
          SizedBox(height: 50),

          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Digite a medida em metros:',
            ),
          ),

          SizedBox(height: 50),

          FilledButton(
            onPressed: _converter,
            child: Text('Converter'),
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