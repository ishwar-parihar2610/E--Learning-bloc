import 'package:e_learning/firebase_options.dart';
import 'package:e_learning/pages/sign%20in/bloc/login_bloc.dart';
import 'package:e_learning/pages/sign%20in/sign_in.dart';
import 'package:e_learning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:e_learning/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
      ],
      child: ScreenUtilInit(builder: (context, child) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'LatoRegular',
              appBarTheme: const AppBarTheme(
                  elevation: 0, backgroundColor: Colors.white),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const WelcomeScreenPage(),
            routes: {
              "/myHomePage": (context) => const MyHomePage(),
              "/signIn": (context) => const SignIn(),
            });
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
