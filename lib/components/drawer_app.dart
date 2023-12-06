// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lockers_app_blocs/screens/lockers/lockers_screen.dart';

// class DrawerApp extends StatelessWidget {
//   const DrawerApp({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: const Color(0xfff5f5fd),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: ListView(
//           children: [
//             ListTile(
//               leading: SvgPicture.asset(
//                 "assets/icons/dashboard.svg",
//                 height: 24,
//               ),
//               title: const Text("Dashboard"),
//               onTap: () {
//                 Navigator.of(context).pushNamed("/");
//               },
//             ),
//             ListTile(
//               leading: SvgPicture.asset(
//                 "assets/icons/locker.svg",
//                 height: 24,
//               ),
//               title: const Text("Casiers"),
//               onTap: () {
//                 Navigator.of(context)
//                     .pushNamed(LockersScreen.routeName);
//               },
//             ),
//             ListTile(
//               leading: SvgPicture.asset(
//                 "assets/icons/student.svg",
//                 height: 24,
//               ),
//               title: const Text("Élèves"),
//               onTap: () {
//                 Navigator.of(context)
//                     .pushNamed(StudentsOverviewScreen.routeName);
//               },
//             ),
//             ListTile(
//               leading: SvgPicture.asset(
//                 "assets/icons/assign.svg",
//                 height: 24,
//               ),
//               title: const Text("Attributions"),
//               onTap: () {
//                 Navigator.of(context)
//                     .pushNamed(AssignationOverviewScreen.routeName);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
