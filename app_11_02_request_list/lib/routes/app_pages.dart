import 'package:app_11_02_request_list/bindings/binding_home.dart';
import 'package:app_11_02_request_list/pages/page_home.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

// Define o path de cada tela
abstract class AppRoutes
{
  static const PG_HOME  = '/';
}

class AppPages
{
  final List<GetPage> pages =
  [
    GetPage(
      name: AppRoutes.PG_HOME,
      page: () => PageHome(),
      binding: BindingHome(),
    ),

  ];
}
