import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

/// A service locator class to manage and retrieve various services.
class LocatorService {
  static final GetIt getIt = GetIt.instance;

  /// Registers all the singleton services.
  static Future<void> configureLocalModuleInjection() async {
    // Register SharedPreferences as a singleton asynchronously
    getIt.registerSingletonAsync<SharedPreferences>(
        SharedPreferences.getInstance);
  }

  /// Getter for SharedPreferences instance.
  static SharedPreferences get sharedPreferences => getIt<SharedPreferences>();
}
