import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestion_freelance/firebase_database/database_methods.dart';
import 'package:gestion_freelance/screens/control/add_new_project.dart';
import '../utils/show_toasts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream<QuerySnapshot>? projectStream;
  final TextEditingController searchController = TextEditingController();
  String selectedFilter = "All";

  // Colores más minimalistas
  final Color scaffoldBg = Colors.white;
  final Color searchBarFill = Color(0xFFF3F4F6);
  final Color selectedColor = Color(0xFF6A4DFF);
  final Color unselectedColor = Color(0xFFB0BEC5);
  final Color accentColor = Color(0xFF6A4DFF);

  @override
  void initState() {
    super.initState();
    getProjectsByFilter(selectedFilter);
  }

  Future<void> getProjectsByFilter(String filter) async {
    switch (filter) {
      case "Completed":
        projectStream = DatabaseMethods().getFilteredProjectData(true);
        break;
      case "Not Completed":
        projectStream = DatabaseMethods().getFilteredProjectData(false);
        break;
      case "Mobile":
        projectStream = DatabaseMethods().getProjectsByCategory("movil");
        break;
      case "Web":
        projectStream = DatabaseMethods().getProjectsByCategory("web");
        break;
      default:
        projectStream = DatabaseMethods().getProjectData();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: AppBar(
        backgroundColor: scaffoldBg,
        elevation: 0,
        title: Text(
          'Project Management',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: selectedColor),
            onPressed: () {
              // Función de configuración o perfil
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: accentColor,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProjectPage()),
          );
          if (result == true) {
            getProjectsByFilter(selectedFilter);
          }
        },
      ),
      body: Column(
        children: [
          searchBar(),
          filterCategories(),
          Expanded(child: projectsList()),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: searchBarFill,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: unselectedColor),
            hintText: 'Search Projects',
            hintStyle: TextStyle(color: unselectedColor),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  Widget filterCategories() {
    List<String> categories = [
      "All",
      "Completed",
      "Not Completed",
      "Mobile",
      "Web"
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 40.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = categories[index];
                });
                getProjectsByFilter(selectedFilter);
              },
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: selectedFilter == categories[index]
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: selectedFilter == categories[index]
                      ? selectedColor
                      : unselectedColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget projectsList() {
    return StreamBuilder<QuerySnapshot>(
      stream: projectStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(color: selectedColor));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot projectData = snapshot.data!.docs[index];
              bool isCompleted = projectData['isCompleted'];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  color: searchBarFill,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      projectData['ProjectName'],
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Category: ${projectData['Category']}\n'
                      'Start Date: ${projectData['StartDate']}\n'
                      'End Date: ${projectData['EndDate']}',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            isCompleted
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color:
                                isCompleted ? selectedColor : unselectedColor,
                          ),
                          onPressed: () async {
                            await DatabaseMethods().updateProjectCompletion(
                              projectData.id,
                              !isCompleted,
                            );
                            getProjectsByFilter(selectedFilter);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.edit, color: selectedColor),
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProjectPage(
                                  projectData: {
                                    'ProjectName': projectData['ProjectName'],
                                    'StartDate': projectData['StartDate'],
                                    'EndDate': projectData['EndDate'],
                                    'Category': projectData['Category'],
                                    'isCompleted': projectData['isCompleted'],
                                    'Id': projectData.id,
                                  },
                                ),
                              ),
                            );
                            if (result == true) {
                              getProjectsByFilter(selectedFilter);
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () async {
                            await DatabaseMethods()
                                .deleteProjectData(projectData.id);
                            ShowToasts().getToast(
                                'Project successfully deleted', Colors.red);
                            getProjectsByFilter(selectedFilter);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
