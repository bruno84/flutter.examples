import 'package:app_10_01_manager_get/bindings/binding_home.dart';
import 'package:app_10_01_manager_get/pages/page_home.dart';
import 'package:app_10_01_manager_get/pages/page_pg1.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

// Define o path de cada tela
abstract class AppRoutes
{
  static const pgHome  = '/';
  static const pg1     = '/pg1';
}

class AppPages
{
  final List<GetPage> pages =
  [
    GetPage(
      name: AppRoutes.pgHome,
      page: () => PageHome(),
      binding: BindingHome(),
    ),

    GetPage(
      name: AppRoutes.pg1,
      page: () => PagePg1(),
    ),

  ];
}
