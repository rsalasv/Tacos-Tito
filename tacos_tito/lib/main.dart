import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tacos_tito/models/userModel.dart';
import 'package:tacos_tito/splash_screen.dart';
import 'package:tacos_tito/views/home_page.dart';
import 'views/all_views.dart';
import 'login/login.dart';

import 'auth/bloc/auth_bloc.dart';

void main() async {
  // inicializar firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // inicializar auth bloc provider

  runApp(
    BlocProvider(
      create: (context) => AuthBloc()..add(VerifyAuthEvent()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AlreadyAuthState) {
          return HomePage(user: UserModel(state.isAdmin,""),);
        } else if (state is UnAuthState) {
          return Login();
        }
        return SplashScreen();
      },
    ),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
