import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:pagatodo/src/config/router.dart';

import 'modules/auth/login/bloc/bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalAuthCubit(),
      child: MaterialApp.router(
        routerConfig: router,
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('es')],
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context)!.appTitle,
        theme: ThemeData.from(
          useMaterial3: false,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff212631),
            primary: const Color(0xff212631),
            secondary: const Color(0xffE1121B),
            tertiary: const Color(0xffFCD800),
          ),
        ),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.redM3),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
