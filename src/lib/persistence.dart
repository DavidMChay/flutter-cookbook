import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PersistenceExample extends StatefulWidget {
  const PersistenceExample({super.key});

  @override
  _PersistenceExampleState createState() => _PersistenceExampleState();
}

class _PersistenceExampleState extends State<PersistenceExample> {
  Database? _database;

  // Variables para SQLite
  String _sqliteResult = '';
  final TextEditingController _sqliteController = TextEditingController();

  // Variables para archivos
  String _fileResult = '';
  final TextEditingController _fileController = TextEditingController();

  // Variables para SharedPreferences
  String _sharedPreferencesResult = '';
  final TextEditingController _sharedPreferencesController =
      TextEditingController();

  Future<Database> _initDatabase() async {
    if (_database != null) return _database!;
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'demo.db');

    _database = await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT)',
        );
      },
      version: 1,
    );
    return _database!;
  }

  Future<void> _insertItem(String name) async {
    try {
      final db = await _initDatabase();
      await db.insert('items', {'name': name});
      setState(() {
        _sqliteResult = 'Ítem insertado: $name';
      });
    } catch (e) {
      setState(() {
        _sqliteResult = 'Error al insertar ítem: $e';
      });
    }
  }

  Future<void> _fetchItems() async {
    try {
      final db = await _initDatabase();
      final items = await db.query('items');
      setState(() {
        _sqliteResult =
            'Ítems: ${items.map((item) => item['name']).join(', ')}';
      });
    } catch (e) {
      setState(() {
        _sqliteResult = 'Error al leer ítems: $e';
      });
    }
  }

  Future<void> _writeToFile(String text) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/demo.txt');
      await file.writeAsString(text);
      setState(() {
        _fileResult = 'Texto guardado en archivo: $text';
      });
    } catch (e) {
      setState(() {
        _fileResult = 'Error al escribir en archivo: $e';
      });
    }
  }

  Future<void> _readFromFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/demo.txt');
      if (await file.exists()) {
        final text = await file.readAsString();
        setState(() {
          _fileResult = 'Texto leído del archivo: $text';
        });
      } else {
        setState(() {
          _fileResult = 'El archivo no existe';
        });
      }
    } catch (e) {
      setState(() {
        _fileResult = 'Error al leer archivo: $e';
      });
    }
  }

  Future<void> _saveToSharedPreferences(String key, String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
      setState(() {
        _sharedPreferencesResult = 'Valor guardado: $value';
      });
    } catch (e) {
      setState(() {
        _sharedPreferencesResult = 'Error al guardar en SharedPreferences: $e';
      });
    }
  }

  Future<void> _readFromSharedPreferences(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString(key) ?? 'No hay valor';
      setState(() {
        _sharedPreferencesResult = 'Valor leído: $value';
      });
    } catch (e) {
      setState(() {
        _sharedPreferencesResult = 'Error al leer de SharedPreferences: $e';
      });
    }
  }

  @override
  void dispose() {
    _database?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Persistencia de Datos')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSection(
              title: 'Persistir datos con SQLite',
              controller: _sqliteController,
              result: _sqliteResult,
              onSave: () => _insertItem(_sqliteController.text),
              onRead: _fetchItems,
            ),
            _buildSection(
              title: 'Leer y escribir archivos',
              controller: _fileController,
              result: _fileResult,
              onSave: () => _writeToFile(_fileController.text),
              onRead: _readFromFile,
            ),
            _buildSection(
              title: 'Almacenar datos clave-valor en disco',
              controller: _sharedPreferencesController,
              result: _sharedPreferencesResult,
              onSave: () => _saveToSharedPreferences(
                  'my_key', _sharedPreferencesController.text),
              onRead: () => _readFromSharedPreferences('my_key'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required TextEditingController controller,
    required String result,
    required VoidCallback onSave,
    required VoidCallback onRead,
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
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Ingresa un valor',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: onSave,
                  child: Text('Guardar'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: onRead,
                  child: Text('Leer'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text('Resultado: $result'),
          ],
        ),
      ),
    );
  }
}
