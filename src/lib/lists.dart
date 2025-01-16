import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListsExample(),
  ));
}

class ListsExample extends StatelessWidget {
  const ListsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listas')),
      body: ListView(
        children: [
          // Título para la sección de lista en cuadrícula
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Lista en cuadrícula (Grid List)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Lista en cuadrícula
          GridView.builder(
            shrinkWrap: true,
            physics:
                NeverScrollableScrollPhysics(), // Desactiva el desplazamiento interno
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Dos columnas
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 6, // Número de elementos
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    'Ítem ${index + 1}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),

          // Título para la sección de lista horizontal
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Lista horizontal (Horizontal List)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Lista horizontal
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: EdgeInsets.all(8.0),
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      'Ítem ${index + 1}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),

          // Título para la sección de lista con diferentes tipos de elementos
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Lista con diferentes tipos de elementos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Lista con diferentes tipos de elementos
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              if (index % 3 == 0) {
                return ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Ítem de imagen ${index + 1}'),
                );
              } else if (index % 3 == 1) {
                return ListTile(
                  leading: Icon(Icons.audiotrack),
                  title: Text('Ítem de audio ${index + 1}'),
                );
              } else {
                return ListTile(
                  leading: Icon(Icons.videocam),
                  title: Text('Ítem de video ${index + 1}'),
                );
              }
            },
          ),
          SizedBox(height: 20),

          // Título para la sección de barra de aplicación flotante
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Barra de aplicación flotante sobre una lista',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Barra de aplicación flotante sobre una lista
          SizedBox(
            height: 200,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('Barra flotante'),
                  floating: true,
                  snap: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ListTile(
                        title: Text('Ítem ${index + 1}'),
                      );
                    },
                    childCount: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Título para la sección de lista con elementos espaciados
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Lista con elementos espaciados',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Lista con elementos espaciados
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (context, index) => Divider(height: 20),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Ítem ${index + 1}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
