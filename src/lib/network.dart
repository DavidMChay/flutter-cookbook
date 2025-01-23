import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert'; // Importa dart:convert para usar jsonDecode

class NetworkExample extends StatefulWidget {
  const NetworkExample({super.key});

  @override
  _NetworkExampleState createState() => _NetworkExampleState();
}

class _NetworkExampleState extends State<NetworkExample> {
  // Variables para almacenar datos
  String _fetchDataResult = '';
  String _authenticatedRequestResult = '';
  String _sendDataResult = '';
  String _updateDataResult = '';
  String _deleteDataResult = '';
  String _webSocketResult = '';
  String _parseJsonResult = '';

  // Instancia de Dio
  final Dio _dio = Dio();

  // Método para obtener datos desde Internet
  Future<void> _fetchData() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts/1');
      setState(() {
        _fetchDataResult = response.data['title'];
      });
    } catch (e) {
      setState(() {
        _fetchDataResult = 'Error: $e';
      });
    }
  }

  // Método para realizar una solicitud autenticada (simulada)
  Future<void> _makeAuthenticatedRequest() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts/1',
        options: Options(headers: {'Authorization': 'Bearer your_token_here'}),
      );
      setState(() {
        _authenticatedRequestResult = response.data['title'];
      });
    } catch (e) {
      setState(() {
        _authenticatedRequestResult = 'Error: $e';
      });
    }
  }

  // Método para enviar datos a Internet
  Future<void> _sendData() async {
    try {
      final response = await _dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          'title': 'foo',
          'body': 'bar',
          'userId': 1,
        },
      );
      setState(() {
        _sendDataResult = 'Datos enviados: ${response.data['id']}';
      });
    } catch (e) {
      setState(() {
        _sendDataResult = 'Error: $e';
      });
    }
  }

  // Método para actualizar datos en Internet
  Future<void> _updateData() async {
    try {
      final response = await _dio.put(
        'https://jsonplaceholder.typicode.com/posts/1',
        data: {
          'id': 1,
          'title': 'foo updated',
          'body': 'bar updated',
          'userId': 1,
        },
      );
      setState(() {
        _updateDataResult = 'Datos actualizados: ${response.data['title']}';
      });
    } catch (e) {
      setState(() {
        _updateDataResult = 'Error: $e';
      });
    }
  }

  // Método para eliminar datos en Internet
  Future<void> _deleteData() async {
    try {
      await _dio.delete('https://jsonplaceholder.typicode.com/posts/1');
      setState(() {
        _deleteDataResult = 'Datos eliminados';
      });
    } catch (e) {
      setState(() {
        _deleteDataResult = 'Error: $e';
      });
    }
  }

  // Método para comunicarse con WebSockets (simulado)
  Future<void> _communicateWithWebSockets() async {
    // Simulación de comunicación con WebSockets
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _webSocketResult = 'Conexión WebSocket simulada';
    });
  }

  // Método para analizar JSON en segundo plano
  Future<void> _parseJsonInBackground() async {
    final jsonString = '''
    {
      "userId": 1,
      "id": 1,
      "title": "Example Title",
      "body": "Example Body"
    }
    ''';
    final parsedJson = jsonDecode(jsonString); // Usa jsonDecode de dart:convert
    setState(() {
      _parseJsonResult = 'Título: ${parsedJson['title']}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Networking')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection(
              title: 'Obtener datos desde Internet',
              result: _fetchDataResult,
              onPressed: _fetchData,
            ),
            _buildSection(
              title: 'Realizar solicitud autenticada',
              result: _authenticatedRequestResult,
              onPressed: _makeAuthenticatedRequest,
            ),
            _buildSection(
              title: 'Enviar datos a Internet',
              result: _sendDataResult,
              onPressed: _sendData,
            ),
            _buildSection(
              title: 'Actualizar datos en Internet',
              result: _updateDataResult,
              onPressed: _updateData,
            ),
            _buildSection(
              title: 'Eliminar datos en Internet',
              result: _deleteDataResult,
              onPressed: _deleteData,
            ),
            _buildSection(
              title: 'Comunicarse con WebSockets',
              result: _webSocketResult,
              onPressed: _communicateWithWebSockets,
            ),
            _buildSection(
              title: 'Analizar JSON en segundo plano',
              result: _parseJsonResult,
              onPressed: _parseJsonInBackground,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String result,
    required VoidCallback onPressed,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: onPressed,
              child: Text('Probar'),
            ),
            SizedBox(height: 10),
            Text('Resultado: $result'),
          ],
        ),
      ),
    );
  }
}
