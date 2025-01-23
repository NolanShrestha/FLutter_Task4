import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.wifi_find_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.laptop_chromebook_outlined),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
