import 'package:tacos_tito/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tacos_tito/views/all_views.dart';
import '../widgets/all_widgets.dart';
import 'login_form.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
    late LoginBloc _loginBloc;

  // para poder agregar eventos al bloc
  // al presionar los botones de login

  bool _showLoading = false;

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  void _googleLogIn(bool _) {
    // invocar al login de firebase con el bloc
    // recodar configurar pantallad Oauth en google Cloud
    print("google");
    // agregar evento al login bloc
    _loginBloc.add(LoginWithGoogleEvent());
  }

  void _facebookLogIn(bool _) {
    // invocar al login de firebase con el bloc
    print("facebook");
    // agregar evento al login bloc
    _loginBloc.add(LoginWithFacebookEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // form content
        // agregar bloc login provider
        // agregar bloc login consumer
        //  revisar estados y retornar error o home page o login page
        Container(
          child: BlocProvider(
            create: (context) {
              _loginBloc = LoginBloc();
              return _loginBloc;
            },
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginErrorState) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("${state.error}:\n${state.code}"),
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginSuccessState) {
                  return HomePage();
                }
                return Container(
                    child: LoginForm(
                      onFacebookLoginTap: _facebookLogIn,
                      onGoogleLoginTap: _googleLogIn,
                    ),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _showLoading ? CircularProgressIndicator() : Container(),
        ),
      ],
    );
  }
}

