import 'package:flutter/material.dart';
import 'exercicios/exercicio_1.dart';
import 'exercicios/exercicio_2.dart';
import 'exercicios/exercicio_3.dart';
import 'exercicios/exercicio_4.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Exercício 1',
                ),
                Tab(
                  text: 'Exercício 2',
                ),
                Tab(
                  text: 'Exercício 3',
                ),
                Tab(
                  text: 'Exercício 4',
                ),
              ],
            ),
          ),

          body: const TabBarView(
            children: [
              Exercicio1(),
              Exercicio2(),
              Exercicio3(),
              Exercicio4(),
            ],
          ),
        ),
      ),
    );
  }
}
