import 'package:flutter/material.dart';

class Exercicio3 extends StatefulWidget{
  const Exercicio3({super.key});

  @override
  Exercicio3State createState() => Exercicio3State();

}

class Exercicio3State extends State<Exercicio3>{
  final TextEditingController _controllerKmInicial = TextEditingController();
  final TextEditingController _controllerKmFinal = TextEditingController();
  final TextEditingController _controllerLitrosConsumidos = TextEditingController();
  final TextEditingController _controllerValorRecebido = TextEditingController();
  final double _valorCombustivel = 2.5;
  String _resposta = '';
  
  void _calcularLucro(){
    final kmInicial = double.tryParse(_controllerKmInicial.text);
    final kmFinal = double.tryParse(_controllerKmFinal.text);
    final litrosConsumidos = double.tryParse(_controllerLitrosConsumidos.text);
    final valorRecebido = double.tryParse(_controllerValorRecebido.text);

    setState(() {
      if (kmInicial == null || kmFinal == null || litrosConsumidos == null || valorRecebido == null){
        _resposta = 'Favor preencher todos os campos com dados válidos!';
        return;
      }

      var media = ((kmFinal - kmInicial) / litrosConsumidos).toString();
      var gastoCombustivel = litrosConsumidos * _valorCombustivel;
      var lucro = (valorRecebido - gastoCombustivel).toString();

      _resposta = "A média de Km/L: $media Km/L \n Lucro foi de R\$ $lucro";

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
            'Rendimento do Taxi!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          
          SizedBox(height: 50),

          TextField(
            controller: _controllerKmInicial,
            decoration: InputDecoration(
              labelText: 'Digite o Km Inicial:',
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _controllerKmFinal,
            decoration: InputDecoration(
              labelText: 'Digite o Km Final:',
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _controllerLitrosConsumidos,
            decoration: InputDecoration(
              labelText: 'Digite a quantidade de Litros de combustível gasta (L):',
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _controllerValorRecebido,
            decoration: InputDecoration(
              labelText: 'Digite o valor recebido no dia (R\$):',
            ),
          ),

          SizedBox(height: 20),
          
          FilledButton(
            onPressed: _calcularLucro,
            child: Text('Calcular Lucro'),
          ),

          SizedBox(height: 50),

          Text(
            _resposta,
            style: TextStyle(
              fontSize: 16
            ),
          )
        ],
      ),
    );
  }
}