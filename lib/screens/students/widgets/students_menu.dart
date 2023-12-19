import 'package:flutter/material.dart';
import 'package:lockers_app_blocs/components/ceff_divider.dart';
import 'package:lockers_app_blocs/screens/students/widgets/menu_widgets/add_student_menu.dart';
import 'package:lockers_app_blocs/screens/students/widgets/menu_widgets/import_student_menu.dart';
import 'package:lockers_app_blocs/screens/students/widgets/menu_widgets/search_student_menu.dart';
import 'package:student_repository/student_repository.dart';

class StudentsMenu extends StatefulWidget {
  const StudentsMenu({
    super.key,
    // required this.searchStudents,
  });

  // final Function(String value) searchStudents;

  @override
  State<StudentsMenu> createState() => _StudentsMenuState();
}

class _StudentsMenuState extends State<StudentsMenu> {
  // List of students searched
  List<Student> searchedStudents = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border(
              left:
                  BorderSide(width: 0.3, color: Theme.of(context).dividerColor),
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 30,
            ),
            child: Column(
              children: [
                const SearchStudentMenu(
                    // searchStudents: (value) => widget.searchStudents(value),
                    ),
                const CEFFDivider(),
                // Form to add a student
                const AddStudentMenu(),
                const CEFFDivider(),
                // Form to import students
                ImportStudentMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
