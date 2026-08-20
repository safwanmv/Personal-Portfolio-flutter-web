import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/portfolio/presentation/pages/portfolio_page.dart';
import 'theme/app_theme.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool('is_dark_theme');
      if (isDark != null) {
        setState(() {
          _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
        });
      }
    } catch (_) {
      // Fallback to dark theme default
    }
  }

  Future<void> _toggleTheme() async {
    final nextMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    setState(() {
      _themeMode = nextMode;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_dark_theme', nextMode == ThemeMode.dark);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final lightTheme = AppTheme.lightTheme();
    final darkTheme = AppTheme.darkTheme();
    final isDark = _themeMode == ThemeMode.dark;

    return MaterialApp(
      title: 'Mohammed Safwan M V — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      builder: (context, child) {
        return AnimatedTheme(
          duration: const Duration(milliseconds: 200),
          data: isDark ? darkTheme : lightTheme,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: PortfolioPage(
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
