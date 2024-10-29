import 'package:flutter/material.dart';
import 'package:gestion_freelance/utils/constants.dart';
import 'package:gestion_freelance/widgets/profile_widgets.dart';

class ProfilePage extends StatelessWidget {
  // Definición de colores para el modo claro
  final Color scaffoldBg = Colors.white; // Fondo del scaffold en modo claro
  final Color borderColor =
      Color(0xFF8E44AD); // Color morado para el borde del avatar
  final Color textColor = Colors.black87; // Color del texto principal
  final Color emailColor = Colors.black54; // Color del texto del email
  final Color secondaryTextColor = Colors.grey; // Color del texto secundario
  final Color primaryColor = Color(0xFF8E44AD); // Color morado principal

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: scaffoldBg, // Color de fondo en modo claro
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: ExactAssetImage('assets/images/avatar.png'),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xFF8E44AD), // Borde en morado
                    width: 5.0,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * .3,
                child: Row(
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: textColor, // Texto en negro
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                        height: 24,
                        child: Image.asset("assets/images/verified.png")),
                  ],
                ),
              ),
              Text(
                'johndoe@gmail.com',
                style: TextStyle(
                  color: emailColor, // Color gris para el email
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: size.height * .7,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    ProfileWidget(
                      icon: Icons.person,
                      title: 'My Profile',
                      iconColor: Color(0xFF8E44AD), // Iconos en morado
                    ),
                    ProfileWidget(
                      icon: Icons.settings,
                      title: 'Settings',
                      iconColor: Color(0xFF8E44AD),
                    ),
                    ProfileWidget(
                      icon: Icons.notifications,
                      title: 'Notifications',
                      iconColor: Color(0xFF8E44AD),
                    ),
                    ProfileWidget(
                      icon: Icons.chat,
                      title: 'FAQs',
                      iconColor: Color(0xFF8E44AD),
                    ),
                    ProfileWidget(
                      icon: Icons.share,
                      title: 'Share',
                      iconColor: Color(0xFF8E44AD),
                    ),
                    ProfileWidget(
                      icon: Icons.logout,
                      title: 'Log Out',
                      iconColor: Color(0xFF8E44AD),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
