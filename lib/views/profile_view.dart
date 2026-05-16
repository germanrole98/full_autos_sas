import 'package:flutter/material.dart';
import 'login_interno_view.dart';
import 'postulaciones_view.dart'; 

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        title: const Text('Cuenta', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // --- AVATAR Y PERFIL ---
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFFFD700),
              child: Text(
                'GR',
                style: TextStyle(fontSize: 36, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Germán R.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Text(
                'Editar perfil',
                style: TextStyle(color: Colors.black),
              ),
              label: const Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // --- SECCIÓN: ÚNETE AL EQUIPO ---
            _buildSectionTitle('Únete al Equipo'),
            _buildListTile('Vacantes'),
            _buildListTile(
              'Enviar hoja de vida',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PostulacionView()),
                );
              },
            ),
            const SizedBox(height: 20),

            // --- SECCIÓN: COLABORADORES ---
            _buildSectionTitle('Colaboradores'),
            _buildListTile(
              'Login Módulo Interno',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginInternoView()),
                );
              },
            ),
            const SizedBox(height: 20),

            // --- SECCIÓN: CONFIGURACIÓN ---
            _buildSectionTitle('Configuración'),
            _buildListTile('Notificaciones'),
          ],
        ),
      ),
    );
  }

  // Mantiene la estructura original del título de sección
  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Estructura modular mejorada para aceptar la acción de navegación de forma opcional
  Widget _buildListTile(String title, {VoidCallback? onTap}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFFFD700), width: 1)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        onTap: onTap, // Ejecuta la acción de navegación si se le asigna una
      ),
    );
  }
}