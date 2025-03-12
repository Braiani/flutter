import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.green[200],
          title: Text(
            'Perfil do Usuário',
            style: TextStyle(
              color: Colors.blue[300],
              fontWeight: FontWeight.bold
            ),
          ),
        ),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: Text('Header do Drawer'),
                )
              ),
              ListTile(
                title: Text('Clique aqui'),
                onTap: () => _dialogBuilder(context),
              )
            ],
          )
        ),

        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle
                ),
                child: Image.network(
                  'https://media.cnn.com/api/v1/images/stellar/prod/220122120946-arnold-schwarzenegger-2021-file.jpg'
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Arnold Schwarzenegger',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Text(
                '77 anos',
                style: TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                  fontSize: 12
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Hollywood, Califórnia',
                style: TextStyle(
                  color: Colors.purple
                ),
              )
            ],
          ),
        ),
      );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert de Exemplo'),
          content: const Text(
            'A dialog is a type of modal window that\n'
            'appears in front of app content to\n'
            'provide critical information, or prompt\n'
            'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}