import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lockers_app_blocs/blocs/user/sign_in_bloc/sign_in_bloc.dart';
import 'package:lockers_app_blocs/responsive.dart';
import 'package:lockers_app_blocs/screens/dashboard/widgets/dashboard_menu.dart';
import 'package:lockers_app_blocs/screens/dashboard/widgets/info_card.dart';
import 'package:lockers_app_blocs/screens/dashboard/widgets/piechartdashboard_widget.dart';
import 'package:user_repository/user_repository.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    required this.myUser,
    super.key,
  });

  final MyUser myUser;

  static String routeName = '/dashboard';
  static int pageIndex = 0;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 0.3,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Bonjour,",
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              "Bienvenue sur l'application de gestion des casiers",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textSelectionTheme
                                    .selectionColor,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Tooltip(
                              waitDuration: const Duration(milliseconds: 500),
                              message:
                                  "Vous êtes connecté en tant que ${widget.myUser.name}",
                              child: Text(
                                widget.myUser.name,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: PopupMenuButton<int>(
                                elevation: 2,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                position: PopupMenuPosition.under,
                                tooltip: "",
                                itemBuilder: (context) => [
                                  PopupMenuItem<int>(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Thème sombre"),
                                        Switch(
                                          value: true,
                                          onChanged: (value) {},
                                        ),
                                      ],
                                    ),
                                    onTap: () async {},
                                  ),
                                  const PopupMenuItem<int>(
                                    child: Text(
                                      "Profil",
                                    ),
                                  ),
                                  const PopupMenuDivider(height: 1),
                                  PopupMenuItem<int>(
                                    onTap: () {
                                      context
                                          .read<SignInBloc>()
                                          .add(const SignOutRequired());
                                    },
                                    child: const Text(
                                      "Déconnexion",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://ik.imagekit.io/yynn3ntzglc/cms/medium_Accroche_chat_poil_long_96efb37bbd_4ma1xrsmu.jpg",
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Tooltip(
                                    message:
                                        "L'image n'a pas réussi à se charger",
                                    child: Icon(
                                      Icons.error_outlined,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: PieChartDashboard(),
                    ),
                    Expanded(
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: [
                          InfoCard(
                            "Nombre total de casiers",
                            "3",
                            "assets/icons/locker.svg",
                            () {},
                          ),
                          InfoCard(
                            "Nombre total \nd'élèves",
                            "3",
                            'assets/icons/student.svg',
                            () {},
                          ),
                          InfoCard(
                            "Nombre d'élèves sans casiers",
                            "3",
                            "assets/icons/student.svg",
                            () {},
                          ),
                          InfoCard(
                            "Nombre de casiers libres",
                            "3",
                            "assets/icons/locker.svg",
                            () => null,
                          ),
                          InfoCard(
                            "Nombre de casiers défectueux",
                            "3",
                            "assets/icons/locker.svg",
                            () => null,
                          ),
                          InfoCard(
                            "Nombre de casiers avec des clés manquantes",
                            "3",
                            "assets/icons/key.svg",
                            () => null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // const Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     BarChartWidget(),
                //     Expanded(child: CautionPieChartWidget()),
                //   ],
                // ),
              ],
            ),
          ),
          Responsive.isDesktop(context)
              ? const DashboardMenu()
              : const Text(''),
        ],
      ),
    );
  }
}
