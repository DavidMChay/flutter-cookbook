import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegación',
    initialRoute: '/',
    routes: {
      '/': (context) => NavigationExample(),
      '/second': (context) => SecondScreen(),
      '/arguments': (context) => ArgumentsScreen(),
      '/returnData': (context) => ReturnDataScreen(),
      '/sendData': (context) => SendDataScreen(),
    },
  ));
}

class NavigationExample extends StatelessWidget {
  const NavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Navegación')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar a una nueva pantalla y regresar
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Navegar a segunda pantalla'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                print('Navegando a /second'); // Mensaje de depuración
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Navegar con ruta nombrada'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Pasar argumentos a una ruta nombrada
                Navigator.pushNamed(
                  context,
                  '/arguments',
                  arguments: 'Hola desde la pantalla principal',
                );
              },
              child: Text('Pasar argumentos'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                // Devolver datos desde una pantalla
                final result =
                    await Navigator.pushNamed(context, '/returnData');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Resultado: $result')),
                );
              },
              child: Text('Devolver datos'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Enviar datos a una nueva pantalla
                Navigator.pushNamed(
                  context,
                  '/sendData',
                  arguments: 'Datos enviados',
                );
              },
              child: Text('Enviar datos'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Animar un widget entre pantallas
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SecondScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Text('Animar widget entre pantallas'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda Pantalla')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Regresar a la pantalla anterior
            Navigator.pop(context);
          },
          child: Text('Regresar'),
        ),
      ),
    );
  }
}

class ArgumentsScreen extends StatelessWidget {
  const ArgumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String argument =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Argumentos')),
      body: Center(
        child: Text(argument),
      ),
    );
  }
}

class ReturnDataScreen extends StatelessWidget {
  const ReturnDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Devolver Datos')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Devolver datos a la pantalla anterior
            Navigator.pop(context, 'Datos devueltos');
          },
          child: Text('Devolver datos'),
        ),
      ),
    );
  }
}

class SendDataScreen extends StatelessWidget {
  const SendDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String argument =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Enviar Datos')),
      body: Center(
        child: Text(argument),
      ),
    );
  }
}
