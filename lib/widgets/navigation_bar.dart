import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/config/app_config.dart';
import 'package:soigne_moi_secretaire/screens/home/home.dart';

class NavigationSidebar extends StatelessWidget {
  final HomeController controller;
  const NavigationSidebar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Text(
              AppConfig.applicationName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          sidebarItem(
            icon: Icons.home,
            label: 'Vue d\'ensemble',
            index: 0,
            context: context,
          ),
          sidebarItem(
            icon: Icons.message,
            label: 'Patients',
            index: 1,
            context: context,
          ),
          sidebarItem(
            icon: Icons.analytics,
            label: 'Docteurs',
            index: 2,
            context: context,
          ),
          sidebarItem(
            icon: Icons.logout,
            label: 'Déconnexion',
            index: 3,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget sidebarItem({
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    final bool isSelected = controller.selectedIndex == index;

    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.black),
      title: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.blue[50],
      onTap: () {
        controller.updateIndex(index);
      },
    );
  }
}
