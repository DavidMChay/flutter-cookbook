import 'package:flutter/material.dart';
import 'design.dart'; // Importamos el archivo de diseño
import 'images.dart'; // Importamos el archivo de imágenes
import 'lists.dart'; // Importamos el archivo de listas
import 'forms.dart'; // Importamos el archivo de formularios
import 'navigation.dart'; // Importamos el archivo de navegación

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cookbook',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
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
        ],
      ),
    );
  }
}
