import 'package:flutter/material.dart';

class Exercicio4 extends StatefulWidget{
  const Exercicio4({super.key});

  @override
  Exercicio4State createState() => Exercicio4State();

}

class Exercicio4State extends State<Exercicio4>{
  final TextEditingController _controllerNumeroEmpregados = TextEditingController();
  final TextEditingController _controllerCustoBicileta = TextEditingController();
  final TextEditingController _controllerBicicletasVendidas = TextEditingController();
  final TextEditingController _controllerSalarioMinimo = TextEditingController();
  String _resposta = '';

  void _calcularInforcamoes (){
    var numerosEmpregados = double.tryParse(_controllerNumeroEmpregados.text);
    var custoBicicleta = double.tryParse(_controllerCustoBicileta.text);
    var biciletasVendidas = double.tryParse(_controllerBicicletasVendidas.text);
    var salarioMinimo = double.tryParse(_controllerSalarioMinimo.text);

    setState(() {
      if(numerosEmpregados == null || custoBicicleta == null || biciletasVendidas == null || salarioMinimo == null){
        _resposta = "Verifique os dados e tente novamente!";
        return;
      }

      var lucroBruto = (custoBicicleta * 1.5) * biciletasVendidas;
      var comissoes = biciletasVendidas * (custoBicicleta * 0.15);
      var salarioFuncionarios = 2 * (salarioMinimo * numerosEmpregados);
      var salarioFinalFuncionario = salarioFuncionarios + comissoes;
      var lucroLiquido = lucroBruto - (salarioFuncionarios + comissoes);

      _resposta = "Salário final de cada funcionário: R\$ $salarioFinalFuncionario \n";
      _resposta += "Lucro líquido da empresa: R\$ $lucroLiquido";
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
            'Rendimento da Loja!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          
          SizedBox(height: 50),

          TextField(
            controller: _controllerNumeroEmpregados,
            decoration: InputDecoration(
              labelText: 'Digite a quantidade de Funcionários:',
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _controllerSalarioMinimo,
            decoration: InputDecoration(
              labelText: 'Digite o valor do Salário Mínimo:',
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _controllerCustoBicileta,
            decoration: InputDecoration(
              labelText: 'Digite o preço de custo de cada Bicicleta:',
            ),
          ),

          SizedBox(height: 20),

          TextField(
            controller: _controllerBicicletasVendidas,
            decoration: InputDecoration(
              labelText: 'Digite a quantidade de Biciletas vendidas:',
            ),
          ),

          SizedBox(height: 20),

          FilledButton(
            onPressed: _calcularInforcamoes,
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