import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegación',
    initialRoute: '/',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) => NavigationExample());
        case '/second':
          return MaterialPageRoute(builder: (context) => SecondScreen());
        case '/arguments':
          final args = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (context) => ArgumentsScreen(argument: args),
          );
        case '/returnData':
          return MaterialPageRoute(builder: (context) => ReturnDataScreen());
        case '/sendData':
          final args = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (context) => SendDataScreen(argument: args),
          );
        default:
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text('Error')),
              body: Center(child: Text('Ruta no encontrada: ${settings.name}')),
            ),
          );
      }
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
  final String? argument;

  const ArgumentsScreen({super.key, this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Argumentos')),
      body: Center(
        child: Text(argument ?? 'No se recibió ningún argumento'),
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
  final String? argument;

  const SendDataScreen({super.key, this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enviar Datos')),
      body: Center(
        child: Text(argument ?? 'No se recibieron datos'),
      ),
    );
  }
}
