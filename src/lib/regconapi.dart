import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RegConApiExample extends StatefulWidget {
  const RegConApiExample({super.key});

  @override
  _RegConApiExampleState createState() => _RegConApiExampleState();
}

class _RegConApiExampleState extends State<RegConApiExample> {
  final Dio _dio = Dio(); // Instancia de Dio para hacer solicitudes HTTP
  final String _apiUrl = 'https://recgonback-8awa0rdv.b4a.run'; // URL de tu API

  // Variables para manejar los eventos paginados
  List<dynamic> _events = [];
  int _offset = 0;
  final int _limit = 10;

  // Controladores para los campos de texto del login
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Método para obtener eventos paginados
  Future<void> _fetchEvents() async {
    try {
      final response = await _dio.get(
        '$_apiUrl/events',
        queryParameters: {
          'limit': _limit,
          'offset': _offset,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _events = response.data['data']; // Actualiza la lista de eventos
          _offset += _limit; // Incrementa el offset para la próxima página
        });
      } else {
        _showSnackBar('Error al obtener eventos: ${response.statusCode}');
      }
    } catch (e) {
      _showSnackBar('Error: $e');
    }
  }

  // Método para iniciar sesión
  Future<void> _login() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackBar('Por favor, ingresa tu correo y contraseña');
      return;
    }

    try {
      final response = await _dio.post(
        '$_apiUrl/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final String userName = response.data['message']; // Mensaje de éxito
        _showSnackBar('Iniciaste sesión como: $userName');
      } else {
        _showSnackBar('Error al iniciar sesión: ${response.data['error']}');
      }
    } catch (e) {
      _showSnackBar('Error: $e');
    }
  }

  // Método para mostrar un SnackBar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RegCon API Network')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Sección de Login
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _login,
              child: Text('Iniciar sesión'),
            ),
            SizedBox(height: 20),

            // Sección de Eventos
            Expanded(
              child: ListView.builder(
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  final event = _events[index];
                  return ListTile(
                    title: Text(event['name'] ?? 'Sin nombre'),
                    subtitle: Text(event['description'] ?? 'Sin descripción'),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _fetchEvents,
              child: Text('Cargar más eventos'),
            ),
          ],
        ),
      ),
    );
  }
}
