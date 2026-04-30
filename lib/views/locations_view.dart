import 'package:flutter/material.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD700),
        title: const Text(
          'Sedes y contacto',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Placeholder del Mapa
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: const Center(child: Text('Mapa de Google Maps aquí')),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildSedeSection('Sede Norte'),
                const SizedBox(height: 20),
                _buildSedeSection('Sede Centro'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSedeSection(String title) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        _buildContactField(Icons.location_on, 'Dirección'),
        _buildContactField(Icons.phone, 'Celular'),
        _buildContactField(Icons.email, 'Email'),
      ],
    );
  }

  Widget _buildContactField(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFFFD700), width: 2),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 15),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
