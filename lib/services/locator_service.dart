import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_swap/data/repository/event_repository.dart';
import 'package:skill_swap/data/repository/favorite_repository.dart';
import 'package:skill_swap/data/repository/message_repository.dart';
import 'package:skill_swap/data/repository/notification_repository.dart';
import 'package:skill_swap/data/repository/review_repository.dart';
import 'package:skill_swap/data/repository/skill_repository.dart';
import 'package:skill_swap/data/repository/skill_request.dart';
import 'package:skill_swap/data/repository/user_repository.dart';
import 'package:skill_swap/services/auth_service.dart';

/// A service locator class to manage and retrieve various services.
class LocatorService {
  static final GetIt getIt = GetIt.instance;
  static Future<void> configureLocalModuleInjection() async {
    getIt.registerSingletonAsync<SharedPreferences>(
        SharedPreferences.getInstance);
    getIt.registerSingleton<AuthService>(AuthService());
    getIt.registerSingleton<EventRepository>(EventRepository());
    getIt.registerSingleton<FavoriteRepository>(FavoriteRepository());
    getIt.registerSingleton<MessageRepository>(MessageRepository());
    getIt.registerSingleton<NotificationRepository>(NotificationRepository());
    getIt.registerSingleton<SkillRequestRepository>(SkillRequestRepository());
    getIt.registerSingleton<SkillRepository>(SkillRepository());
    getIt.registerSingleton<UserRepository>(UserRepository());
    getIt.registerSingleton<ReviewRepository>(ReviewRepository());
  }

  static SharedPreferences get sharedPreferences => getIt<SharedPreferences>();
  static AuthService get authService => getIt<AuthService>();
  static EventRepository get eventRepository => getIt<EventRepository>();
  static FavoriteRepository get favoriteRepository =>
      getIt<FavoriteRepository>();
  static MessageRepository get messageRepository => getIt<MessageRepository>();
  static NotificationRepository get notificationRepository =>
      getIt<NotificationRepository>();
  static SkillRequestRepository get skillRequestRepository =>
      getIt<SkillRequestRepository>();
  static SkillRepository get skillRepository => getIt<SkillRepository>();
  static UserRepository get userRepository => getIt<UserRepository>();
  static ReviewRepository get reviewRepository => getIt<ReviewRepository>();
}
