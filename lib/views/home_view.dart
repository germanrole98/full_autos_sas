import 'agendamiento_cita_view.dart'; 
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header amarillo (Requiere tu asset para la silueta del carro)
          Container(
            width: double.infinity,
            color: const Color(0xFFFFD700),
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            child: Column(
              children: [
                const Text(
                  'Bienvenido\nFull Autos\nServiteca',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTopButton(
                      Icons.handshake, 
                      'Alianzas',
                    ),
                    _buildTopButton(
                      Icons.assignment, 
                      'Agendar Cita',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AgendamientoCitaView()),
                        );
                      },
                    ),
                    _buildTopButton(
                      Icons.directions_car, 
                      'Nosotros',
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Sección de Experiencias
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Experiencias',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildReviewCard(
                  'Excelente servicio',
                  '27 feb | German R',
                  'El servicio fue rapido y confiable, el carro por ahora anda bien. Volveré en la proxima vez. Recomiendo al 100 esta serviteca.',
                ),
                _buildReviewCard(
                  'Buena atencion',
                  '3 ene | Andres L',
                  'El servicio fue rapido y confiable, el carro por...',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopButton(IconData icon, String label, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap, 
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xFFFFD700), 
              child: Icon(icon, color: Colors.black, size: 26),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(String title, String date, String content) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                Icon(Icons.star, size: 16, color: Colors.black),
                Icon(Icons.star, size: 16, color: Colors.black),
                Icon(Icons.star, size: 16, color: Colors.black),
                Icon(Icons.star, size: 16, color: Colors.black),
                Icon(Icons.star, size: 16, color: Colors.black),
              ],
            ),
            const SizedBox(height: 10),
            Text(content),
          ],
        ),
      ),
    );
  }
}
