import 'package:flutter/material.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> services = [
      'Frenos',
      'Alineación',
      'Motor',
      'Mantenimiento General',
      'Llantas',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFD700),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        title: const Text(
          'Catálogo de servicios',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Container(
            height: 120,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors
                  .grey
                  .shade800, // Reemplazar con DecorationImage para la foto real
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              services[index],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(color: Colors.black54, blurRadius: 4),
                ], // Sombra para legibilidad
              ),
            ),
          );
        },
      ),
    );
  }
}
