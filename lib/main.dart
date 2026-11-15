import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
  url: 'https://ktqtcgzrhwmvinlssywr.supabase.co',
  // ignore: deprecated_member_use
  anonKey: 'sb_publishable_Izz6VCi4cMJk1bQQqnm74A_D1eW7DUa'
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return MaterialApp(
      title: 'Gerenciamento de Usuários',
      theme: ThemeData(primarySwatch: Colors.blue),

      initialRoute: supabase.auth.currentSession == null ? '/login' : '/home',
      routes: {
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/home': (context) => const HomeScreen(),
},
    );
  }
}