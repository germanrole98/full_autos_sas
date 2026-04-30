import 'package:flutter/material.dart';
import '../widgets/expert_card.dart'; // Asegúrate de que la ruta sea correcta

class ExpertsView extends StatelessWidget {
  const ExpertsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de ejemplo para poblar la vista
    final List<Map<String, String>> expertos = [
      {
        'nombre': 'Juan León',
        'especialidad': 'Experto en motores',
        'experiencia': 'Más de 5 años de experiencia.',
        'imagen': 'assets/images/experto1.jpg',
      },
      {
        'nombre': 'Pedro Pérez',
        'especialidad': 'Especialista en frenos',
        'experiencia': '8 años brindando seguridad.',
        'imagen': 'assets/images/experto2.jpg',
      },
      {
        'nombre': 'Carlos Ruiz',
        'especialidad': 'Técnico en alineación',
        'experiencia': 'Especialista en suspensión y dirección.',
        'imagen': 'assets/images/experto3.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0), // Gris claro de fondo
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD700), // Amarillo Full Autos
        title: const Text(
          'Nuestros expertos',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        centerTitle: false,
        // Si vienes de la pantalla de servicios, Flutter añade el botón de atrás automáticamente
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: expertos.length,
        itemBuilder: (context, index) {
          final experto = expertos[index];
          return ExpertCard(
            name: experto['nombre']!,
            specialty: experto['especialidad']!,
            experience: experto['experiencia']!,
            imagePath: experto['imagen']!,
          );
        },
      ),
    );
  }
}
