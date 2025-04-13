// import 'package:awqaf_supervisor/modules/core_modules/module_auth/core/authorization_routes.dart';
// import 'package:awqaf_supervisor/modules/core_modules/module_auth/domain/service/auth_service.dart';
// import 'package:awqaf_supervisor/modules/module_menu/menu_routes.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';
//
//  import 'package:awqaf_supervisor/generated/assets.dart';
// import 'package:awqaf_supervisor/injection.dart';
//
// import 'package:awqaf_supervisor/modules/core_modules/module_splash/splash_routes.dart';
//
// import 'package:awqaf_supervisor/utils/global/global_state_manager.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   Future<void> someChecks() async {
//      bool result = await ii<GlobalStateManager>().hasConnection();
//
//     ii<GlobalStateManager>().offlineMode = (result == false).obs;
//     _getNextRoute().then((route) {
//       Get.offAndToNamed(route);
//     });
//   }
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       someChecks();
//     });
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: SvgPicture.asset(Assets.svgLogo),
//     ));
//   }
//
//   Future<String> _getNextRoute() async {
//       try {
//         bool alreadySigned = ii<AuthService>().isLoggedIn;
//         if (alreadySigned) {
//           return  MenuRoutes.menuRoute;
//         } else {
//           return AuthorizationRoutes.loginScreen;
//       }
//     } catch (e) {
//       ii<Logger>().e(SplashRoutes.splashScreen, e.toString());
//     }
//       return AuthorizationRoutes.loginScreen;
//   }
// }
