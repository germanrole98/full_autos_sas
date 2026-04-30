import 'package:flutter/material.dart';

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
            _buildSectionTitle('Únete al Equipo'),
            _buildListTile('Vacantes'),
            _buildListTile('Enviar hoja de vida'),
            _buildListTile('Postulaciones'),
            const SizedBox(height: 20),
            _buildSectionTitle('Colaboradores'),
            _buildListTile('Login Módulo Interno'),
            const SizedBox(height: 20),
            _buildSectionTitle('Configuración'),
            _buildListTile('Notificaciones'),
          ],
        ),
      ),
    );
  }

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

  Widget _buildListTile(String title) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFFFD700), width: 1)),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        onTap: () {},
      ),
    );
  }
}
