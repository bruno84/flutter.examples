import 'package:app_07_05_manager_get/bindings/binding1.dart';
import 'package:app_07_05_manager_get/bindings/binding2.dart';
import 'package:app_07_05_manager_get/bindings/binding_home.dart';
import 'package:app_07_05_manager_get/pages/page_home.dart';
import 'package:app_07_05_manager_get/pages/page_pg1.dart';
import 'package:app_07_05_manager_get/pages/page_pg2.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

// Define o path de cada tela
abstract class Routes
{
  static const pgHome  = '/';
  static const pg1     = '/pg1';
  static const pg2     = '/pg2';
}

class AppPages
{
  final List<GetPage> pages =
  [
    GetPage(
      name: Routes.pgHome,
      page: () => PageHome(),
      binding: BindingHome(),
    ),

    GetPage(
      name: Routes.pg1,
      page: () => PagePg1(),
      binding: Binding1(),
    ),

    GetPage(
      name: Routes.pg2,
      page: () => PagePg2(),
      binding: Binding2(),
    ),
  ];
}
