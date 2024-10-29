import 'package:flutter/material.dart';
import 'package:gestion_freelance/screens/ItemPage.dart';
import 'package:gestion_freelance/screens/control/add_new_project.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Colores para el modo claro
  final Color scaffoldBg = Color(0xFFF5F5F5);
  final Color searchBarFill = Color(0xFFE8E8E8);
  final Color coffeeSelected = Color(0xFF8A2BE2); // Morado como color primario
  final Color coffeeUnselected = Color(0xFF757575);
  final Color gradientTopLeft = Color(0xFFF3F4F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Encuentra\nProyectos por hacer',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: searchBarFill,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: coffeeUnselected),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Buscar lo que necesitas',
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Proyectos Destacados Hoy',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0,
                  children: [
                    _buildProjectCard(
                        context, 'Proyecto Branding', 'assets/images/uiux.png'),
                    _buildProjectCard(
                        context, 'Diseño UI/UX', 'assets/images/uiux.png'),
                    _buildProjectCard(
                        context, 'Marketing Digital', 'assets/images/uiux.png'),
                    _buildProjectCard(
                        context, 'Fotografía', 'assets/images/uiux.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(
      BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
