import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final CollectionReference _projectCollection =
      FirebaseFirestore.instance.collection('Projects');

  // Validación de campos requeridos
  bool _validateProjectData(Map<String, dynamic> projectData) {
    return projectData.containsKey('ProjectName') &&
        projectData['ProjectName'] != null &&
        projectData['ProjectName'].toString().isNotEmpty &&
        projectData.containsKey('EndDate') &&
        projectData['EndDate'] != null;
  }

  // Agregar datos de un proyecto con validación
  Future<void> addProjectData(Map<String, dynamic> projectData,
      [String? id]) async {
    if (!_validateProjectData(projectData)) {
      print('Error: Project name and End Date are required.');
      throw Exception('Project name and End Date are required fields.');
    }
    try {
      if (id != null) {
        await _projectCollection.doc(id).set(projectData);
      } else {
        await _projectCollection.add(projectData);
      }
    } catch (e) {
      print('Error adding project: $e');
      throw Exception('Failed to add project data.');
    }
  }

  // Obtener todos los datos de los proyectos como Stream
  Stream<QuerySnapshot> getProjectData() {
    return _projectCollection.snapshots();
  }

  // Obtener proyectos filtrados por estado de completado
  Stream<QuerySnapshot> getFilteredProjectData(bool isCompleted) {
    return _projectCollection
        .where('isCompleted', isEqualTo: isCompleted)
        .snapshots();
  }

  // Obtener proyectos filtrados por categoría
  Stream<QuerySnapshot> getProjectsByCategory(String category) {
    return _projectCollection
        .where('Category', isEqualTo: category)
        .snapshots();
  }

  // Actualizar datos de un proyecto con validación
  Future<void> updateProjectData(
      String id, Map<String, dynamic> updatedProjectData) async {
    if (!_validateProjectData(updatedProjectData)) {
      print('Error: Project name and End Date are required.');
      throw Exception('Project name and End Date are required fields.');
    }
    try {
      await _projectCollection.doc(id).update(updatedProjectData);
    } catch (e) {
      print('Error updating project: $e');
      throw Exception('Failed to update project data.');
    }
  }

  // Actualizar el estado de completado de un proyecto
  Future<void> updateProjectCompletion(String id, bool isCompleted) async {
    try {
      await _projectCollection.doc(id).update({'isCompleted': isCompleted});
    } catch (e) {
      print('Error updating project completion: $e');
      throw Exception('Failed to update project completion status.');
    }
  }

  // Eliminar datos de un proyecto específico
  Future<void> deleteProjectData(String id) async {
    try {
      await _projectCollection.doc(id).delete();
    } catch (e) {
      print('Error deleting project: $e');
      throw Exception('Failed to delete project data.');
    }
  }

  // Obtener proyecto específico por ID con validación
  Future<DocumentSnapshot> getProjectById(String id) async {
    try {
      DocumentSnapshot project = await _projectCollection.doc(id).get();
      if (project.exists) {
        Map<String, dynamic> projectData =
            project.data() as Map<String, dynamic>;
        if (!_validateProjectData(projectData)) {
          throw Exception('Invalid project data: missing required fields.');
        }
      }
      return project;
    } catch (e) {
      print('Error fetching project by ID: $e');
      rethrow;
    }
  }
}
