import 'package:flutter/material.dart';
import 'package:soigne_moi_secretaire/config/app_config.dart';

class NavigationSidebar extends StatelessWidget {
  const NavigationSidebar({super.key});

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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SidebarItem(icon: Icons.home, label: 'Vue d\'ensemble'),
          SidebarItem(icon: Icons.message, label: 'Patients'),
          SidebarItem(icon: Icons.analytics, label: 'Docteurs'),
          SidebarItem(icon: Icons.settings, label: 'Paramètres'),
          SidebarItem(icon: Icons.logout, label: 'Déconnexion'),
        ],
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const SidebarItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label),
      onTap: () {},
    );
  }
}
