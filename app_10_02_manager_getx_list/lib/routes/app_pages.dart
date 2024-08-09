import 'package:get/get_navigation/src/routes/get_route.dart';
import '../bindings/binding_list_fav.dart';
import '../bindings/binding_list_home.dart';
import '../pages/page_list_fav.dart';
import '../pages/page_list_home.dart';

// Define o path de cada tela
abstract class AppRoutes
{
  static const PG_LIST_HOME  = '/';
  static const PG_LIST_FAV   = '/pg_list_fav';
}

class AppPages
{
  final List<GetPage> pages =
  [
    GetPage(
      name: AppRoutes.PG_LIST_HOME,
      page: () => PageListHome(),
      binding: BindingListHome(),
    ),

    GetPage(
      name: AppRoutes.PG_LIST_FAV,
      page: () => PageListFav(),
      binding: BindingListFav(),
    ),

  ];
}
