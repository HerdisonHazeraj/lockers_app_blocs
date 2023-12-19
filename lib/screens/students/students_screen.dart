import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockers_app_blocs/blocs/student/delete_student_bloc/delete_student_bloc.dart';
import 'package:lockers_app_blocs/blocs/student/get_students_bloc/get_students_bloc.dart';
import 'package:lockers_app_blocs/blocs/student/update_student_bloc/update_student_bloc.dart';
import 'package:lockers_app_blocs/responsive.dart';
import 'package:lockers_app_blocs/screens/students/widgets/student_item.dart';
import 'package:lockers_app_blocs/screens/students/widgets/student_update.dart';
import 'package:lockers_app_blocs/screens/students/widgets/students_menu.dart';
import 'package:student_repository/student_repository.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen(
    this.students, {
    super.key,
  });

  final Map<String, List<Student>> students;

  static String routeName = '/students';
  static int pageIndex = 2;

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  late List<bool> isExpYear;
  ScrollController scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isExpYear = List.generate(widget.students.length, (index) => true);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ExpansionPanelList(
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() {
                            isExpYear[index] = !isExpYear[index];
                          });
                        },
                        expandedHeaderPadding: const EdgeInsets.all(6),
                        animationDuration: const Duration(milliseconds: 800),
                        children: [
                          ...widget.students.entries.map(
                            (e) => ExpansionPanel(
                              isExpanded: isExpYear[
                                  widget.students.keys.toList().indexOf(e.key)],
                              canTapOnHeader: true,
                              headerBuilder: (context, isExpanded) {
                                return ListTile(
                                  title: Text(
                                    'Tous les élèves de ${e.key}e année',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                );
                              },
                              body: ExpansionPanelList(
                                expansionCallback:
                                    (int index, bool isExpanded) {
                                  setState(() {
                                    e.value[index].isUpdating =
                                        !e.value[index].isUpdating;
                                  });
                                },
                                expandedHeaderPadding: const EdgeInsets.all(0),
                                animationDuration:
                                    const Duration(milliseconds: 500),
                                children: [
                                  ...e.value.map(
                                    (s) => ExpansionPanel(
                                      isExpanded: s.isUpdating,
                                      canTapOnHeader: true,
                                      headerBuilder: (context, isExpanded) {
                                        return Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: BlocProvider(
                                            create: (context) =>
                                                DeleteStudentBloc(
                                              studentRepository: context
                                                  .read<GetStudentsBloc>()
                                                  .studentRepository,
                                            ),
                                            child: StudentItem(
                                              student: s,
                                              // refreshList: () => refreshList(),
                                            ),
                                          ),
                                        );
                                      },
                                      body: s.isUpdating == true
                                          ? BlocProvider(
                                              create: (context) =>
                                                  UpdateStudentBloc(
                                                studentRepository: context
                                                    .read<GetStudentsBloc>()
                                                    .studentRepository,
                                              ),
                                              child: StudentUpdate(
                                                student: s,
                                                showUpdateForm: () => setState(
                                                  () {
                                                    s.isUpdating =
                                                        !s.isUpdating;
                                                  },
                                                ),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Responsive.isDesktop(context)
            ? const StudentsMenu(
                // searchStudents: (value) => searchStudents(value),
                )
            : const Text(""),
      ],
    );
  }
}
