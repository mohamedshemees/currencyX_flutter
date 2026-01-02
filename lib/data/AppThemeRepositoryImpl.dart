import 'package:currencyx/domain/AppThemeRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeRepositoryImpl implements AppThemeRepository {
  SharedPreferencesAsync sharedPreferencesAsync;

  AppThemeRepositoryImpl({required this.sharedPreferencesAsync});

  @override
  Future<String?> getAppTheme() {
     return sharedPreferencesAsync.getString("APP_THEME");
  }

  @override
  void setAppTheme(String themeMode) {
    sharedPreferencesAsync.setString("APP_THEME", themeMode);
  }
  }
