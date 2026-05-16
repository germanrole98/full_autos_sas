import 'package:flutter/material.dart';

class LoginInternoView extends StatefulWidget {
  const LoginInternoView({super.key});

  @override
  State<LoginInternoView> createState() => _LoginInternoViewState();
}

class _LoginInternoViewState extends State<LoginInternoView> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  // Nueva paleta de colores integrada
  final Color primaryColor = const Color(0xFFFFD700); // Amarillo Dorado
  final Color textColor = Colors.black;               // Negro para textos principales y botón
  final Color iconColor = Colors.grey;                // Gris para iconos decorativos

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      // Validación exitosa: Simulación de ingreso al sistema
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.black),
              SizedBox(width: 10),
              Text(
                'Autenticación exitosa. Bienvenida/o al módulo interno.',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          backgroundColor: const Color(0xFFFFD700), // Fondo amarillo para el aviso de éxito
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Fondo claro y limpio
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400), // Mantiene la estética en pantallas grandes
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // --- ENCABEZADO CORPORATIVO ---
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.admin_panel_settings_rounded,
                            size: 64,
                            color: textColor, // Icono principal en Negro
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'FULL AUTOS SAS',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: textColor, // Texto en Negro
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Módulo Interno Administrativo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: iconColor, // Texto secundario en Gris
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // --- CAMPO: USUARIO ---
                    TextFormField(
                      controller: _userController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: textColor),
                      decoration: InputDecoration(
                        labelText: 'Usuario / Código de Empleado',
                        labelStyle: TextStyle(color: iconColor),
                        prefixIcon: Icon(Icons.person_outline, color: iconColor), // Icono Gris
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: primaryColor, width: 2), // Borde Amarillo al enfocar
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Por favor, ingrese su usuario';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // --- CAMPO: CONTRASEÑA ---
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      style: TextStyle(color: textColor),
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: iconColor),
                        prefixIcon: Icon(Icons.lock_outline, color: iconColor), // Icono Gris
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                            color: iconColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: primaryColor, width: 2), // Borde Amarillo al enfocar
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese su contraseña';
                        }
                        if (value.length < 4) {
                          return 'La contraseña debe tener al menos 4 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),

                    // --- BOTÓN PRINCIPAL DE INICIO DE SESIÓN ---
                    ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor, // El botón ahora es Amarillo (`0xFFFFD700`)
                        foregroundColor: textColor,    // El texto dentro del botón es Negro
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // --- NOTA AL PIE ---
                    Text(
                      'Uso exclusivo para personal autorizado.',
                      style: TextStyle(
                        fontSize: 11,
                        color: iconColor, // Nota en Gris
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}