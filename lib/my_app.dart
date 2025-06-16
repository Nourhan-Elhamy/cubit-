
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/views/widgets/cubit.dart';
import 'features/views/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Example',
      home: BlocProvider(
        create: (_) => TestCubitStates(),
        child: HomeScreen(),
      ),
    );
  }
}