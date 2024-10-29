import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_freelance/screens/control/add_new_project.dart';

class ItemBottomNavBar extends StatelessWidget {
  final Color scaffoldBg = Colors.white; // Fondo claro
  final Color searchBarFill =
      Color(0xFFF3F3F3); // Color claro para barra de búsqueda
  final Color coffeeSelected =
      Color.fromARGB(255, 129, 54, 221); // Color azul para el precio y botones
  final Color coffeeUnselected = Color.fromARGB(
      255, 226, 226, 229); // Color gris para elementos sin seleccionar
  final Color gradientTopLeft =
      const Color.fromARGB(255, 255, 255, 255); // Fondo claro para el navbar

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFF5F9FD), // Color de fondo claro
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Precio:",
                style: TextStyle(
                  color: Colors.black87, // Color de texto oscuro
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 6),
              Text(
                "\$100",
                style: TextStyle(
                  color: coffeeSelected, // Color para el precio en azul
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProjectPage(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: coffeeSelected, // Color del botón en azul
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Añadir",
                style: TextStyle(
                  color: Colors.white, // Texto en blanco
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
