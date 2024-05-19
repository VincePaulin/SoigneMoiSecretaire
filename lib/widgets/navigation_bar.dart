import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/config/app_config.dart';
import 'package:soigne_moi_secretaire/screens/home/home.dart';

import 'logout_button.dart';

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
            key: const Key('nav_overview'),
            icon: Icons.home,
            label: 'Vue d\'ensemble',
            index: 0,
            context: context,
          ),
          sidebarItem(
            key: const Key('nav_patients'),
            icon: Icons.person,
            label: 'Patients',
            index: 1,
            context: context,
          ),
          sidebarItem(
            key: const Key('nav_doctors'),
            icon: Icons.local_hospital_rounded,
            label: 'Docteurs',
            index: 2,
            context: context,
          ),
          const Spacer(),
          const LogoutButton()
        ],
      ),
    );
  }

  Widget sidebarItem({
    required Key key,
    required IconData icon,
    required String label,
    required int index,
    required BuildContext context,
  }) {
    final bool isSelected = controller.selectedIndex == index;

    return ListTile(
      key: key,
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
