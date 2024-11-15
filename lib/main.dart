import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTimeIndex = 0; // Estado para el selector de tiempo
  int _selectedViewIndex = 0; // Estado para el selector de vista
  double _sliderValue = 50.0; // Valor del slider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apartado de Botones'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Selector de tiempo (Day, Week, Month, Year)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ToggleButtons(
                isSelected: List.generate(4, (index) => index == _selectedTimeIndex),
                onPressed: (index) {
                  setState(() {
                    _selectedTimeIndex = index;
                  });
                },
                borderRadius: BorderRadius.circular(10),
                selectedColor: Colors.white,
                fillColor: Colors.teal,
                color: Colors.grey,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Day"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Week"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Month"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Year"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Slider llamativo con animación
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('Slider Llamativo'),
                    Slider(
                      value: _sliderValue,
                      min: 0.0,
                      max: 100.0,
                      onChanged: (double newValue) {
                        setState(() {
                          _sliderValue = newValue;
                        });
                      },
                    ),
                    Text('Valor: ${_sliderValue.toStringAsFixed(2)}'),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Selector de vista (Individual / Grupal)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ToggleButtons(
                isSelected: List.generate(2, (index) => index == _selectedViewIndex),
                onPressed: (index) {
                  setState(() {
                    _selectedViewIndex = index;
                  });
                },
                borderRadius: BorderRadius.circular(50),
                selectedColor: Colors.white,
                fillColor: Colors.blueGrey,
                color: Colors.grey,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.person),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.group),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Fila de iconos
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.home, size: 40, color: Colors.blue),
                  onPressed: () {
                    print('Botón Home presionado');
                  },
                  iconSize: 40,
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.search, size: 40, color: Colors.green),
                  onPressed: () {
                    print('Botón Search presionado');
                  },
                  iconSize: 40,
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.settings, size: 40, color: Colors.red),
                  onPressed: () {
                    print('Botón Settings presionado');
                  },
                  iconSize: 40,
                ),
                SizedBox(width: 20), // Espacio entre los botones
                IconButton(
                  icon: Icon(Icons.link, size: 40, color: Colors.purple),  // Icono de enlace
                  onPressed: () {
                    print('Botón Add Link presionado');
                  },
                  iconSize: 40,
                ),
              ],
            ),
          ],
        ),
      ),

      // Barra de navegación inferior
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 72, 154, 221), // Color personalizado
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home, size: 30, color: Colors.white),
              onPressed: () {
                print("Home button pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, size: 30, color: Colors.white),
              onPressed: () {
                print("Settings button pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.help, size: 30, color: Colors.white),
              onPressed: () {
                print("Help button pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.contact_mail, size: 30, color: Colors.white),
              onPressed: () {
                print("Contact button pressed");
              },
            ),
            IconButton(
              icon: Icon(Icons.info, size: 30, color: Colors.white),
              onPressed: () {
                print("Info button pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}
