import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show
        GlobalCupertinoLocalizations,
        GlobalMaterialLocalizations,
        GlobalWidgetsLocalizations;
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:test_ui/main_module/bottom_nav_screen.dart';

import 'core_modules/module_localization/service/localization_service/localization_service.dart';
import 'core_modules/module_splash/splash_routes.dart';
import 'core_modules/module_theme/service/theme_service/theme_service.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'generated/l10n.dart';
import 'injection.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configureDependencies('');
      runApp(ii<MyApp>());
      FlutterError.onError = (FlutterErrorDetails details) async {
        if (kDebugMode) {
          FlutterError.presentError(details);
          FlutterError.dumpErrorToConsole(details);
        } else {
          if (kReleaseMode) {
            Zone.current.handleUncaughtError(
              details.exception,
              details.stack as StackTrace,
            );
          }
        }
      };
    },
    (Object error, StackTrace stack) async {},
    zoneSpecification: ZoneSpecification(
      // Intercept all print calls
      print: (self, parent, zone, line) async {
        if (kDebugMode) {
          parent.print(zone, line);
        }
      },
    ),
  );
}

@injectable
class MyApp extends StatefulWidget {
  final AppThemeDataService _themeDataService;


  const MyApp(this._themeDataService);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  late ThemeData activeTheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    activeTheme = widget._themeDataService.getActiveTheme(context);

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale.fromSubtags(languageCode: 'ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme:  activeTheme,
      supportedLocales: S.delegate.supportedLocales,

      home:  BottomNavScreen(),
    );
  }
}
