import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const HomeBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF475269),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.category_outlined,
              color: currentIndex == 0 ? Colors.white : Colors.white70,
              size: 32,
            ),
            onPressed: () => onTap(0),
          ),
          IconButton(
            icon: Icon(
              Icons.list, // Cambiado a icono de lista
              color: currentIndex == 1 ? Colors.white : Colors.white70,
              size: 32,
            ),
            onPressed: () => onTap(1),
          ),
          IconButton(
            icon: Icon(
              Icons.account_balance_wallet, // Cambiado a icono de billetera
              color: currentIndex == 2 ? Colors.white : Colors.white70,
              size: 32,
            ),
            onPressed: () => onTap(2),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: currentIndex == 3 ? Colors.white : Colors.white70,
              size: 32,
            ),
            onPressed: () => onTap(3),
          ),
        ],
      ),
    );
  }
}
