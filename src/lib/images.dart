import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ImagesExample(),
  ));
}

class ImagesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Imágenes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Título para la sección de imágenes desde Internet
            Text(
              'Imágenes desde Internet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Esta es una imagen cargada desde una URL:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

            // Imagen desde Internet
            Image.network(
              'https://m.web.umkc.edu/mkakh3/assignment3/images/nature_300x300.jpg', // URL de la imagen
              fit: BoxFit.cover, // Ajustar la imagen al espacio disponible
            ),
            SizedBox(height: 20),

            // Título para la sección de fade-in con placeholder
            Text(
              'Efecto de desvanecimiento (Fade-in)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Esta imagen se desvanece mientras se carga, mostrando un marcador de posición:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),

            // Imagen con efecto de desvanecimiento y placeholder
            FadeInImage.assetNetwork(
              placeholder: 'assets/placeholder.png', // Marcador de posición
              image:
                  'https://m.web.umkc.edu/mkakh3/assignment3/images/nature_300x300.jpg', // URL de la imagen
              fit: BoxFit.cover,
              fadeInDuration:
                  Duration(milliseconds: 500), // Duración del efecto
            ),
          ],
        ),
      ),
    );
  }
}
