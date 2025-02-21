// import 'package:gestion_freelance/firebase_database/database_methods.dart';
// import 'package:gestion_freelance/utils/show_toasts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:random_string/random_string.dart';

// class AddNewData extends StatefulWidget {
//   const AddNewData({super.key});

//   @override
//   State<AddNewData> createState() => _AddNewDataState();
// }

// class _AddNewDataState extends State<AddNewData> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController professionController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple.shade700,
//         title: const Text(
//           'Add New User',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Name',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18),
//             ),
//             SizedBox(
//               height: 5.0,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 10.0, right: 10.0),
//               decoration: BoxDecoration(
//                 border: Border.all(width: 2.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(border: InputBorder.none),
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             const Text(
//               'Profession',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18),
//             ),
//             SizedBox(
//               height: 5.0,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 10.0, right: 10.0),
//               decoration: BoxDecoration(
//                 border: Border.all(width: 2.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: TextField(
//                 controller: professionController,
//                 decoration: InputDecoration(border: InputBorder.none),
//               ),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             const Text(
//               'Age',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18),
//             ),
//             SizedBox(
//               height: 5.0,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 10.0, right: 10.0),
//               decoration: BoxDecoration(
//                 border: Border.all(width: 2.0),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: TextField(
//                 controller: ageController,
//                 decoration: InputDecoration(border: InputBorder.none),
//               ),
//             ),
//             const SizedBox(
//               height: 40.0,
//             ),
//             Center(
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple.shade700),
//                 onPressed: () async {
//                   String id = randomAlphaNumeric(8);
//                   Map<String, dynamic> userData = {
//                     "Name": nameController.text,
//                     "Profession": professionController.text,
//                     "Id": id,
//                     "Age": ageController.text,
//                   };
//                   await DatabaseMethods()
//                       .addUserData(userData, id)
//                       .then((value) {
//                     ShowToasts()
//                         .getToast('Data Saved Successfully', Colors.green);
//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 25.0, vertical: 15.0),
//                   child: Text(
//                     'Add User',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15.0,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
