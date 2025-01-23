import 'package:flutter/material.dart';

class AnimationExample extends StatelessWidget {
  const AnimationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animaciones')),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Transición de ruta de página'),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const PageTransitionExample(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              );
            },
          ),
          ListTile(
            title: Text('Simulación física'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PhysicsAnimationExample(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Animar propiedades de un contenedor'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnimatedContainerExample(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Fundir un widget dentro y fuera'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FadeInOutExample(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Ejemplo de transición de ruta de página
class PageTransitionExample extends StatelessWidget {
  const PageTransitionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transición de página')),
      body: Center(
        child: Text('¡Esta es una página con transición animada!'),
      ),
    );
  }
}

// Ejemplo de simulación física
class PhysicsAnimationExample extends StatefulWidget {
  const PhysicsAnimationExample({super.key});

  @override
  _PhysicsAnimationExampleState createState() =>
      _PhysicsAnimationExampleState();
}

class _PhysicsAnimationExampleState extends State<PhysicsAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simulación física')),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: const FlutterLogo(size: 100),
        ),
      ),
    );
  }
}

// Ejemplo de animación de propiedades de un contenedor
class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;

  void _animateContainer() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contenedor animado')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _width,
              height: _height,
              color: _color,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _animateContainer,
              child: Text('Animar'),
            ),
          ],
        ),
      ),
    );
  }
}

// Ejemplo de fundir un widget dentro y fuera
class FadeInOutExample extends StatefulWidget {
  const FadeInOutExample({super.key});

  @override
  _FadeInOutExampleState createState() => _FadeInOutExampleState();
}

class _FadeInOutExampleState extends State<FadeInOutExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fundir dentro y fuera')),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const FlutterLogo(size: 100),
        ),
      ),
    );
  }
}
