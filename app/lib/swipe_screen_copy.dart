import 'package:flutter/material.dart';

class SwipeScreenDragDrope extends StatelessWidget {
  const SwipeScreenDragDrope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Establecer el color de fondo transparente
        elevation: 0, // Deshabilitar el sombreado de la AppBar
        title: const Text('SwipeBook app'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            // SECTION 1
            child: Container(
              color: Colors.black,
              child: Center(
                child: InteractiveImage(),
                // child: Image.asset('assets/images/covers/harry_potter1_cover.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text('Sección 2'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class InteractiveImage extends StatefulWidget {
  @override
  _InteractiveImageState createState() => _InteractiveImageState();
}

class _InteractiveImageState extends State<InteractiveImage> {
  bool _isDragging = false;
  double _x = 0;
  double _y = 0;

  void _startDrag(DragStartDetails details) {
    setState(() {
      _isDragging = true;
    });
  }

  void _onDrag(DragUpdateDetails details) {
    setState(() {
      _x = details.globalPosition.dx;
      _y = details.globalPosition.dy;
    });
  }

  void _endDrag(DragEndDetails details) {
    setState(() {
      _isDragging = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: 300,
          height: 300,
          left: _x - 50,
          top: _y - 50,
          child: Draggable(
            child: Image.asset(
              'assets/images/covers/harry_potter1_cover.jpg', // Cambia la ruta a tu imagen
            ),
            feedback: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/images/covers/harry_potter1_cover.jpg', // Cambia la ruta a tu imagen
              ),
            ),
            onDragStarted: () => _startDrag(DragStartDetails()),
            onDragEnd: (details) => _endDrag(DragEndDetails()),
            onDragUpdate: _onDrag,
          ),
        ),
      ],
    );
  }
}
