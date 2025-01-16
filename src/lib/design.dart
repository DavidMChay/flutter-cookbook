import 'package:flutter/material.dart';

class DesignExample extends StatelessWidget {
  const DesignExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diseño')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Exportar fuentes desde un paquete'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExportFontsExample()),
              );
            },
          ),
          ListTile(
            title: Text('Agregar un cajón a una pantalla'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DrawerExample()),
              );
            },
          ),
          ListTile(
            title: Text('Actualizar la UI según la orientación'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrientationExample()),
              );
            },
          ),
          ListTile(
            title: Text('Trabajar con pestañas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TabsExample()),
              );
            },
          ),
          ListTile(
            title: Text('Usar una fuente personalizada'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomFontExample()),
              );
            },
          ),
          ListTile(
            title: Text('Mostrar un SnackBar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SnackBarExample()),
              );
            },
          ),
          ListTile(
            title: Text('Usar temas para compartir colores y estilos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThemesExample()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Subpantallas para cada funcionalidad
class ExportFontsExample extends StatelessWidget {
  const ExportFontsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exportar fuentes desde un paquete')),
      body: Center(
        child: Text('Ejemplo de exportación de fuentes'),
      ),
    );
  }
}

class DrawerExample extends StatelessWidget {
  const DrawerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cajón de navegación')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Encabezado del cajón'),
            ),
            ListTile(
              title: Text('Opción 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Ejemplo de cajón de navegación'),
      ),
    );
  }
}

class OrientationExample extends StatelessWidget {
  const OrientationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orientación')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Center(
            child: Text(
              orientation == Orientation.portrait
                  ? 'Modo vertical'
                  : 'Modo horizontal',
              style: TextStyle(fontSize: 24),
            ),
          );
        },
      ),
    );
  }
}

class TabsExample extends StatelessWidget {
  const TabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pestañas'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Inicio'),
              Tab(icon: Icon(Icons.settings), text: 'Configuración'),
              Tab(icon: Icon(Icons.person), text: 'Perfil'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Contenido de Inicio')),
            Center(child: Text('Contenido de Configuración')),
            Center(child: Text('Contenido de Perfil')),
          ],
        ),
      ),
    );
  }
}

class CustomFontExample extends StatelessWidget {
  const CustomFontExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fuente personalizada')),
      body: Center(
        child: Text(
          'Texto con fuente personalizada',
          style: TextStyle(
            fontFamily: 'MiFuente', // Cambia esto por el nombre de tu fuente
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class SnackBarExample extends StatelessWidget {
  const SnackBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SnackBar')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('¡Hola! Esto es un SnackBar')),
            );
          },
          child: Text('Mostrar SnackBar'),
        ),
      ),
    );
  }
}

class ThemesExample extends StatelessWidget {
  const ThemesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Temas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Texto con tema personalizado',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Botón con tema'),
            ),
          ],
        ),
      ),
    );
  }
}
