import 'package:beamer/beamer.dart';
import 'package:carbon/gen/colors.gen.dart';
import 'package:carbon/gen/fonts.gen.dart';
import 'package:carbon/home_screen.dart';
import 'package:carbon/model/organization.dart';
import 'package:carbon/organization_screen.dart';
import 'package:carbon/scope_screen.dart';
import 'package:carbon/site_screen.dart';
import 'package:carbon/translations/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

const _appName = 'oodrive_carbon';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(OrganizationAdapter());
  Hive.registerAdapter(SiteAdapter());
  Hive.registerAdapter(Scope1Adapter());
  Hive.registerAdapter(Scope2Adapter());
  Hive.registerAdapter(Scope3Adapter());
  Hive.registerAdapter(EmissionAdapter());

  const boxName = 'organizations';
  Box<Organization> box;
  try {
    box = await Hive.openBox(boxName);
  } catch (_) {
    // In case of migration issue, we simply erase everything :)
    await Hive.deleteBoxFromDisk(boxName);
    box = await Hive.openBox(boxName);
  }

  runApp(MyApp(box));
}

class MyApp extends StatelessWidget {
  MyApp(this._box);

  final Box<Organization> _box;

  final _beamerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const BeamPage(title: _appName, child: HomeScreen()),
        '/:organizationId': (context, state, data) => const BeamPage(title: _appName, child: OrganizationScreen()),
        '/:organizationId/:siteId': (context, state, data) => const BeamPage(title: _appName, child: SiteScreen()),
        '/:organizationId/:siteId/:scopeId': (context, state, data) => const BeamPage(title: _appName, child: ScopeScreen()),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OrganizationsState(_box),
      child: MaterialApp.router(
        routeInformationParser: BeamerParser(),
        routerDelegate: _beamerDelegate,
        title: _appName,
        localizationsDelegates: const [
          Translation.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: Translation.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 24)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black54),
              overlayColor: MaterialStateProperty.all<Color>(Colors.grey[100]!),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(ColorName.lightGreen),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              elevation: MaterialStateProperty.all<double>(0),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: FontFamily.varelaRound,
        ),
      ),
    );
  }
}
