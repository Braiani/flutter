import 'package:flutter/material.dart';
import 'about.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainWidgets(),
      initialRoute: '/',
      routes: {
        '/': (context) => MainWidgets(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}

class MainWidgets extends StatelessWidget{
  const MainWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageWidget(index: 0),

            SizedBox(height: 30),

            NameWidget()
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Sobre'
          )
        ]
      ),
    );
  }
}


class ImageWidget extends StatefulWidget {
  final int index;
  const ImageWidget({required this.index});

  @override
  State<ImageWidget> createState() => _ImageWidget();
}

class _ImageWidget extends State<ImageWidget> {
  List images = [
    'https://media.cnn.com/api/v1/images/stellar/prod/220122120946-arnold-schwarzenegger-2021-file.jpg',
    'https://cinemaweb.com.br/wp-content/uploads/2024/06/pessoa-keanu-reeves.jpg'
  ];

  String image = '';

  @override
  void initState() {
    setState(() {
      image = images[widget.index];
    });
    super.initState();
  }

  void changeImage() {

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle
      ),
      child: Image.network(
        image
      ),
    );
    
  }
}


class NameWidget extends StatefulWidget {
  const NameWidget({super.key});

  @override
  State<NameWidget> createState() => _NameWidget();
}

class _NameWidget extends State<NameWidget> {
  String name = 'Arnold Schwarzenegger';
  int changes = 1;

  List names = [
    'Arnold Schwarzenegger',
    'Keanu Reeves',
    'Will Smith',
    'Tom Cruise',
  ];

  void changeName() {
    

    setState(() {
      if (changes < names.length){
        name = names[changes];
        changes++;
      }else{
        changes = 0;
        name = names[changes];
        changes++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 30
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: changeName,
          child: Text('Trocar de Nome')
        )
      ],
    );
  }
}