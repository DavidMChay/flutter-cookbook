import 'package:flutter/material.dart';

class FormsExample extends StatefulWidget {
  const FormsExample({super.key});

  @override
  _FormsExampleState createState() => _FormsExampleState();
}

class _FormsExampleState extends State<FormsExample> {
  // Controladores para los campos de texto
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Variable para manejar el foco
  final _focusNode = FocusNode();

  // Variable para almacenar el valor del campo de texto
  String _textFieldValue = '';

  @override
  void dispose() {
    // Limpiar los controladores y el nodo de foco
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formularios')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Campo de texto para el nombre
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Campo de texto para el correo electrónico
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu correo electrónico';
                  }
                  if (!value.contains('@')) {
                    return 'Ingresa un correo electrónico válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Campo de texto para la contraseña
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa tu contraseña';
                  }
                  if (value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Campo de texto con manejo de foco y cambios
              TextFormField(
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: 'Escribe algo',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit),
                ),
                onChanged: (value) {
                  setState(() {
                    _textFieldValue = value;
                  });
                },
              ),
              SizedBox(height: 10),
              Text(
                'Valor actual: $_textFieldValue',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Botón para enviar el formulario
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Si el formulario es válido, mostrar los valores
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Nombre: ${_nameController.text}\n'
                          'Correo: ${_emailController.text}\n'
                          'Contraseña: ${_passwordController.text}',
                        ),
                      ),
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
