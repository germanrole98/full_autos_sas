import 'package:flutter/material.dart';

class PostulacionView extends StatefulWidget {
  const PostulacionView({super.key});

  @override
  State<PostulacionView> createState() => _PostulacionViewState();
}

class _PostulacionViewState extends State<PostulacionView> {
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para capturar la información
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _experienciaController = TextEditingController();

  // Paleta de colores Full Autos SAS
  final Color primaryColor = const Color(0xFFFFD700); // Amarillo Dorado
  final Color textColor = Colors.black;               // Negro
  final Color iconColor = Colors.grey;                // Gris

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _experienciaController.dispose();
    super.dispose();
  }

  void _enviarPostulacion() {
    if (_formKey.currentState!.validate()) {
      // Simulación de envío exitoso
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Icon(Icons.check_circle, color: primaryColor, size: 30),
                const SizedBox(width: 10),
                const Text('¡Proceso Exitoso!'),
              ],
            ),
            content: const Text(
              'Tu hoja de vida ha sido enviada exitosamente a Full Autos SAS.',
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra el diálogo
                  _formKey.currentState!.reset(); // Limpia el formulario
                },
                child: const Text('Entendido', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Trabaja con Nosotros', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- ENCABEZADO ---
              const Text(
                'Postulación para Vacantes',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Completa los datos para aplicar a Full Autos SAS',
                style: TextStyle(color: iconColor, fontSize: 14),
              ),
              const SizedBox(height: 30),

              // --- CAMPO: NOMBRE ---
              _buildTextField(
                controller: _nombreController,
                label: 'Nombre Completo',
                icon: Icons.person_outline,
                hint: 'Ej: Juan Pérez',
              ),
              const SizedBox(height: 20),

              // --- CAMPO: EMAIL ---
              _buildTextField(
                controller: _emailController,
                label: 'Correo Electrónico',
                icon: Icons.email_outlined,
                hint: 'ejemplo@correo.com',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'El correo es obligatorio';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Ingresa un correo válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // --- CAMPO: TELÉFONO ---
              _buildTextField(
                controller: _telefonoController,
                label: 'Teléfono de Contacto',
                icon: Icons.phone_android_outlined,
                hint: 'Ej: 300 123 4567',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),

              // --- CAMPO: EXPERIENCIA ---
              _buildTextField(
                controller: _experienciaController,
                label: 'Experiencia Laboral',
                icon: Icons.work_outline,
                hint: 'Describe brevemente tus cargos anteriores...',
                maxLines: 4, // Campo más grande para texto largo
              ),
              const SizedBox(height: 40),

              // --- BOTÓN DE ENVÍO ---
              ElevatedButton(
                onPressed: _enviarPostulacion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: textColor,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                ),
                child: const Text(
                  'Enviar Hoja de Vida',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para construir campos de texto con estilo consistente
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: iconColor),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
      ),
      validator: validator ?? (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
    );
  }
}