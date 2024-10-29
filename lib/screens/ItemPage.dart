import 'package:gestion_freelance/screens/control/add_new_project.dart';
import 'package:gestion_freelance/widgets/ItemBottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemPage extends StatelessWidget {
  final Color scaffoldBg = Colors.white; // Fondo blanco
  final Color searchBarFill =
      Color(0xFFE0E0E0); // Gris claro para los contenedores
  final Color coffeeSelected =
      Color(0xFF8A2BE2); // Morado para elementos destacados
  final Color coffeeUnselected =
      Color(0xFF757575); // Gris para elementos secundarios
  final Color gradientTopLeft = Color(0xFF8A2BE2); // Morado para acentos
  final Color textColor = Colors.black87; // Texto oscuro para buena visibilidad
  final Color secondaryTextColor =
      Color(0xFF4F4F4F); // Texto secundario más suave

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: searchBarFill, // Fondo claro para el botón
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: gradientTopLeft.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: textColor, // Ícono oscuro
                        ),
                      ),
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
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: searchBarFill,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: gradientTopLeft.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          size: 30,
                          color: Colors.red, // Ícono en rojo
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height * 0.43,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 70),
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: gradientTopLeft
                            .withOpacity(0.1), // Fondo claro morado
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Image.asset(
                      "assets/images/uiux.png",
                      height: 300,
                      width: 300,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F9FD), // Fondo gris claro
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: gradientTopLeft.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Diseño de Web",
                            style: TextStyle(
                              color: textColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$45",
                            style: TextStyle(
                              color: coffeeSelected,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 20,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (index) {},
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Ofrecemos un diseño de logo profesional y atractivo, adaptado a tus necesidades específicas. Perfecto para darle un nuevo aire a tu marca.",
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: 17,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          // Se pueden añadir otros elementos si es necesario.
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ItemBottomNavBar(),
    );
  }
}
