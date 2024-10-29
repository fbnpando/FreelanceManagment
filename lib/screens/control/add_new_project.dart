import 'package:flutter/material.dart';
import 'package:gestion_freelance/firebase_database/database_methods.dart';
import 'package:intl/intl.dart';

class AddProjectPage extends StatefulWidget {
  final Map<String, dynamic>?
      projectData; // Datos del proyecto existente para editar

  const AddProjectPage({Key? key, this.projectData}) : super(key: key);

  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final DatabaseMethods databaseMethods = DatabaseMethods();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  String _category = 'web';
  String? projectId;

  @override
  void initState() {
    super.initState();
    if (widget.projectData != null) {
      _nameController.text = widget.projectData!['ProjectName'];
      _startDateController.text = widget.projectData!['StartDate'];
      _endDateController.text = widget.projectData!['EndDate'];
      _category = widget.projectData!['Category'];
      projectId = widget.projectData!['Id'];
    } else {
      _startDateController.text =
          DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _endDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _saveProject() async {
    if (_nameController.text.isEmpty || _endDateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, completa todos los campos obligatorios.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Map<String, dynamic> projectData = {
      'ProjectName': _nameController.text,
      'StartDate': _startDateController.text,
      'EndDate': _endDateController.text,
      'Category': _category,
      'isCompleted': widget.projectData?['isCompleted'] ?? false,
    };

    try {
      if (projectId != null) {
        await databaseMethods.updateProjectData(projectId!, projectData);
      } else {
        await databaseMethods.addProjectData(projectData);
      }
      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar el proyecto: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectId != null ? "Editar Proyecto" : "Añadir Proyecto"),
        backgroundColor: const Color(0xFF2C3E50),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen del proyecto
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/uiux.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombre del Proyecto *',
                    ),
                  ),
                  TextField(
                    controller: _startDateController,
                    decoration: const InputDecoration(
                      labelText: 'Fecha de Inicio (YYYY-MM-DD)',
                      enabled: false,
                    ),
                  ),
                  TextField(
                    controller: _endDateController,
                    decoration: const InputDecoration(
                      labelText: 'Fecha de Fin (YYYY-MM-DD) *',
                    ),
                    onTap: () => _selectEndDate(context),
                    readOnly: true,
                  ),
                  DropdownButtonFormField<String>(
                    value: _category,
                    items: const [
                      DropdownMenuItem(value: 'web', child: Text('Web')),
                      DropdownMenuItem(value: 'movil', child: Text('Móvil')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _category = value!;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Categoría'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveProject,
                    child: Text(projectId != null
                        ? "Guardar Cambios"
                        : "Añadir Proyecto"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
