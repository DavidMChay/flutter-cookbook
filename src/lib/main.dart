import 'package:flutter/material.dart';
import 'design.dart'; // Importamos el archivo de diseño
import 'images.dart'; // Importamos el archivo de imágenes
import 'lists.dart'; // Importamos el archivo de listas
import 'forms.dart'; // Importamos el archivo de formularios
import 'navigation.dart'; // Importamos el archivo de navegación
import 'network.dart'; // Importamos el archivo de networking

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cookbook',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MainMenu(),
      routes: {
        '/second': (context) => SecondScreen(),
        '/arguments': (context) => ArgumentsScreen(
              argument: ModalRoute.of(context)!.settings.arguments as String?,
            ),
        '/returnData': (context) => ReturnDataScreen(),
        '/sendData': (context) => SendDataScreen(
              argument: ModalRoute.of(context)!.settings.arguments as String?,
            ),
      },
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Cookbook')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Diseño'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DesignExample()),
              );
            },
          ),
          ListTile(
            title: Text('Imágenes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ImagesExample()),
              );
            },
          ),
          ListTile(
            title: Text('Listas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListsExample()),
              );
            },
          ),
          ListTile(
            title: Text('Formularios'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormsExample()),
              );
            },
          ),
          ListTile(
            title: Text('Navegación'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavigationExample()),
              );
            },
          ),
          ListTile(
            title: Text('Networking'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NetworkExample()),
              );
            },
          ),
        ],
      ),
    );
  }
}
