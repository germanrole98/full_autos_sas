import 'package:flutter/material.dart';
import 'package:full_autos_sas/views/home_view.dart';
import 'package:full_autos_sas/views/services_view.dart';
import 'package:full_autos_sas/views/locations_view.dart';
import 'package:full_autos_sas/views/profile_view.dart';
import 'package:full_autos_sas/views/experts_view.dart';

void main() {
  runApp(const FullAutosApp());
}

class FullAutosApp extends StatelessWidget {
  const FullAutosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full Autos Serviteca',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFD700), // Amarillo Full Autos
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'Roboto', // Ajusta a la fuente de tu diseño
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    const HomeView(),
    const ExpertsView(),
    const ServicesView(),
    const LocationsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF222222), // Fondo oscuro del nav bar
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            backgroundColor: const Color(0xFF222222),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFFFFD700),
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment, size: 30),
                label: 'Agenda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.build, size: 30),
                label: 'Servicios',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_on, size: 30),
                label: 'Sedes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined, size: 30),
                label: 'Cuenta',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
