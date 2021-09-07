import 'package:ecart/features/auth/login/binding/login_binding.dart';
import 'package:ecart/features/auth/login/login_screen.dart';
import 'package:ecart/features/auth/register/binding/register_binding.dart';
import 'package:ecart/features/auth/register/register_screen.dart';
import 'package:ecart/features/bottomBarScreen/bottomBar_screen.dart';
import 'package:ecart/features/categories/binding/categories_binding.dart';
import 'package:ecart/features/categories/categories_screen.dart';
import 'package:ecart/features/favourites/binding/favourite_binding.dart';
import 'package:ecart/features/favourites/favourites_screen.dart';
import 'package:ecart/features/forgotPassword/binding/forgotPassword_binding.dart';
import 'package:ecart/features/forgotPassword/forgotPassword_screen.dart';
import 'package:ecart/features/home/binding/home_binding.dart';
import 'package:ecart/features/home/home_screen.dart';
import 'package:ecart/features/more/binding/more_binding.dart';
import 'package:ecart/features/more/more_screen.dart';
import 'package:ecart/features/product_details/binding/product_binding.dart';
import 'package:ecart/features/product_details/product_screen.dart';
import 'package:ecart/features/products/binding/products_binding.dart';
import 'package:ecart/features/products/products_screen.dart';
import 'package:ecart/features/search/binding/search_binding.dart';
import 'package:ecart/features/search/search_screen.dart';
import 'package:ecart/features/shared/models/category.dart';
import 'package:ecart/features/shared/models/product.dart';
import 'package:ecart/features/splash/splash_screen.dart';
import 'package:ecart/routes/routes_names.dart';
import 'package:get/get.dart';

class AppRouter {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutesNames.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutesNames.registerScreen,
      binding: RegisterBinding(),
      page: () => RegisterScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutesNames.loginScreen,
      binding: LoginBinding(),
      page: () => LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutesNames.forgotPasswordScreen,
      binding: ForgotPasswordBinding(),
      page: () => ForgotPasswordScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutesNames.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutesNames.categoriesScreen,
      page: () => CategoriesScreen(),
      binding: CategoriesBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutesNames.favouritesScreen,
      page: () => FavouritesScreen(),
      binding: FavouritesBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutesNames.moreScreen,
      page: () => MoreScreen(),
      binding: MoreBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: AppRoutesNames.bottomBarScreen,
        page: () => BottomBarScreen(),
        bindings: [
          HomeBinding(),
          CategoriesBinding(),
          FavouritesBinding(),
          MoreBinding()
        ],
        transition: Transition.fadeIn),
    GetPage(
      name: AppRoutesNames.productsScreen,
      page: () => ProductsScreen(),
      arguments: Category,
      binding: ProductsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutesNames.searchScreen,
      page: () => SearchScreen(),
      binding: SearchBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutesNames.productDetailsScreen,
      page: () => ProductDetailsScreen(),
      arguments: Product,
      binding: ProductBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
