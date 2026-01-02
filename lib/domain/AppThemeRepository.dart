
abstract class AppThemeRepository{
  void setAppTheme(String themeMode);
  Future<String?> getAppTheme();
}