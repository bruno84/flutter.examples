import 'package:get/get_navigation/src/routes/get_route.dart';
import '../bindings/binding_home.dart';
import '../pages/page_home.dart';
import '../pages/page_pg1.dart';

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
