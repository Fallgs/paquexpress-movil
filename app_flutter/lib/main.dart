// app_flutter/lib/main.dart
import 'package:flutter/material.dart';
import '/screens/entrega_screen.dart'; // Asegúrate de tener esta importación
import '/screens/home_screen.dart';
import '/screens/login_screen.dart';
import '/services/auth_service.dart';

void main() {
  runApp(PaquexpressApp());
}

class PaquexpressApp extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paquexpress App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // FutureBuilder para decidir la pantalla inicial (Persistencia de sesión)
      home: FutureBuilder<bool>(
        future: _authService.isAuthenticated(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          // Si está autenticado, va a Home, sino a Login
          return snapshot.data == true ? HomeScreen() : LoginScreen(); 
        },
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
      // Nota: El EntregaScreen se maneja con MaterialPageRoute, no con rutas nombradas
    );
  }
}