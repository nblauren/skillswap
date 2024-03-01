import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:skill_swap/firebase_options.dart';
import 'package:skill_swap/services/locator_service.dart';
import 'package:skill_swap/ui/screens/widget_tree.dart';
import 'config/theme.dart';
import 'cubit/theme_cubit.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';

// Handle incoming app links
void initUniLinks() async {
  try {
    // Listen for incoming app links
    final initialUri = await getInitialUri();
    if (initialUri != null) {
      handleAppLink(initialUri);
    }
  } on PlatformException {
    // Handle exception
    print('Failed to initialize uni_links');
  }
}

// Handle the app link
void handleAppLink(Uri uri) {
  print('Received app link: $uri');
}

/// The main entry point of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configure dependency injection
  await LocatorService.configureLocalModuleInjection();

  /// Initialize packages
  await EasyLocalization.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  // Initialize Deeplink
  initUniLinks();

  // Initialize Hive
  final Directory tmpDir = await getTemporaryDirectory();
  Hive.init(tmpDir.toString());

  // Initialize Hydrated Bloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: tmpDir,
  );

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('de'),
      ],
      fallbackLocale: const Locale('en'),
      useFallbackTranslations: true,
      child: const MyApp(),
    ),
  );
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (BuildContext context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeModeState>(
        builder: (BuildContext context, ThemeModeState state) {
          return MaterialApp(
            /// Localization is not available for the title.
            title: 'SkillSwap',

            /// Theme stuff
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,

            /// Localization stuff
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: const WidgetTree(),
          );
        },
      ),
    );
  }
}
