import 'package:e_learning/pages/register/bloc/register_bloc.dart';
import 'package:e_learning/pages/sign%20in/bloc/login_bloc.dart';
import 'package:e_learning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        )
      ];
}
