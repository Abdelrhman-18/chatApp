import 'package:chat_application/features/loginPage/logic/cubit/login_cubit.dart';
import 'package:chat_application/features/register/logic/cubit/register_cubit.dart';
import 'package:chat_application/firebase_options.dart';
import 'package:chat_application/widget/myApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( 
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterCubit()),
         BlocProvider(create: (_) => LoginCubit()),
      ],
      child: const MyApp(),
    ),
  );
}
