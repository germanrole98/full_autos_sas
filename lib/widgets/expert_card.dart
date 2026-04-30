import 'package:flutter/material.dart';

class ExpertCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String experience;
  final String imagePath;

  const ExpertCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFFFD700), width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/foto_mecanico.jpg',
            width: 100,
            height: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.star, size: 14),
                        Icon(Icons.star, size: 14),
                        Icon(Icons.star, size: 14),
                        Icon(Icons.star, size: 14),
                        Icon(Icons.star, size: 14),
                      ],
                    ),
                  ],
                ),
                Text(
                  specialty,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
                Text(
                  experience,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Elegir este técnico',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
