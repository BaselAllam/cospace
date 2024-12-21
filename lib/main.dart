import 'package:cospace/app_settings/logic/app_settings_cubit.dart';
import 'package:cospace/app_settings/views/splash_screen.dart';
import 'package:cospace/cospace/logic/cospace_cubit.dart';
import 'package:cospace/user/logic/user_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyBMj0sUBKo4qdLj1QBqPzkb-UW6Jse8O_0",
    authDomain: "cospace-795df.firebaseapp.com",
    projectId: "cospace-795df",
    storageBucket: "cospace-795df.firebasestorage.app",
    messagingSenderId: "your-messaging-sender-id",
    appId: "1:355002771621:android:9613bea174856086ae054c",
  );
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CoSpaceCubit(),
        ),
        BlocProvider(
          create: (context) => AppSettingsCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}