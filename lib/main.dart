import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_netflix/cubit/cubits.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBarCubit>(
          create: (context) => AppBarCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Netflix UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // is not restarted.
          scaffoldBackgroundColor: Colors.black,
          // primarySwatch: Colors.blue,
        ),
        home: const NavScreen(),
      ),
    );
  }
}
