import 'package:flutter/material.dart';

class AgendamientoCitaView extends StatefulWidget {
  const AgendamientoCitaView({super.key});

  @override
  State<AgendamientoCitaView> createState() => _AgendamientoCitaViewState();
}

class _AgendamientoCitaViewState extends State<AgendamientoCitaView> {
  final _formKey = GlobalKey<FormState>();

  // Lista de técnicos disponibles
  final List<String> _tecnicos = [
    'Juan León (Experto en motores)',
    'Pedro Pérez (Especialista en frenos)',
    'Carlos Ruiz (Técnico en alineación)',
  ];

  // Mapa de servicios con su estado de selección
  final Map<String, bool> _servicios = {
    'Frenos': false,
    'Alineación y Balanceo': false,
    'Motor': false,
    'Mantenimiento General': false,
    'Llantas': false,
  };

  String? _tecnicoSeleccionado;
  bool _mostrarErrorServicios = false;

  // Paleta de colores Full Autos SAS
  final Color primaryColor = const Color(0xFFFFD700); // Amarillo Dorado
  final Color textColor = Colors.black;               // Negro
  final Color iconColor = Colors.grey;                // Gris

  // Verifica si hay al menos un servicio seleccionado
  bool get _hayServicioSeleccionado => _servicios.values.contains(true);

  void _agendarCita() {
    setState(() {
      // Validar el checklist de servicios de forma manual
      _mostrarErrorServicios = !_hayServicioSeleccionado;
    });

    // Validar tanto el Form (Dropdown) como el checklist
    if (_formKey.currentState!.validate() && _hayServicioSeleccionado) {
      // Simulación de agendamiento exitoso
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Icon(Icons.check_circle_rounded, color: primaryColor, size: 30),
                const SizedBox(width: 10),
                const Text('Cita Confirmada', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Tu servicio ha sido programado correctamente.', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 12),
                Text('Técnico: $_tecnicoSeleccionado', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra el diálogo
                  _reiniciarFormulario();
                },
                child: const Text('Entendido', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      );
    }
  }

  void _reiniciarFormulario() {
    setState(() {
      _formKey.currentState!.reset();
      _tecnicoSeleccionado = null;
      _mostrarErrorServicios = false;
      _servicios.updateAll((key, value) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Fondo claro estándar
      appBar: AppBar(
        title: const Text('Agendar Cita', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
              // --- TÍTULO DE SECCIÓN ---
              const Text(
                'Programación de Servicio',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                'Selecciona el personal y los servicios requeridos',
                style: TextStyle(color: iconColor, fontSize: 14),
              ),
              const SizedBox(height: 30),

              // --- SELECCIÓN DE TÉCNICO (DROPDOWN) ---
              DropdownButtonFormField<String>(
                value: _tecnicoSeleccionado,
                decoration: InputDecoration(
                  labelText: 'Selecciona el Técnico Encargado',
                  labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
                  prefixIcon: Icon(Icons.build_circle_outlined, color: iconColor),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                ),
                items: _tecnicos.map((String tecnico) {
                  return DropdownMenuItem<String>(
                    value: tecnico,
                    child: Text(tecnico, style: const TextStyle(fontSize: 14)),
                  );
                }).toList(),
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _tecnicoSeleccionado = nuevoValor;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Es obligatorio asignar un técnico para tu servicio';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // --- SECCIÓN: CHECKLIST DE SERVICIOS ---
              Row(
                children: [
                  Icon(Icons.construction_outlined, color: textColor, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Servicios a Realizar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 0.5, height: 20),
              
              // Listado interactivo de checkboxes dentro de una tarjeta limpia
              Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: _servicios.keys.map((String nombreServicio) {
                    return CheckboxListTile(
                      title: Text(nombreServicio, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                      value: _servicios[nombreServicio],
                      activeColor: textColor, // Caja interna negra al seleccionarse
                      checkColor: primaryColor,  // Chulo o palomita en Amarillo Dorado
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      onChanged: (bool? valorNuevo) {
                        setState(() {
                          _servicios[nombreServicio] = valorNuevo ?? false;
                          // Ocultar mensaje de error de forma dinámica si ya marcó uno
                          if (_hayServicioSeleccionado) _mostrarErrorServicios = false;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),

              // --- AVISO DE ERROR PARA CHECKBOXES ---
              if (_mostrarErrorServicios)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Text(
                    'Debes seleccionar al menos un servicio del listado',
                    style: TextStyle(color: Colors.red[700], fontSize: 12),
                  ),
                ),
              const SizedBox(height: 40),

              // --- BOTÓN PRINCIPAL DE AGENDAMIENTO ---
              ElevatedButton(
                onPressed: _agendarCita,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Fondo Amarillo
                  foregroundColor: textColor,    // Texto Negro
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                ),
                child: const Text(
                  'Agendar Cita',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}