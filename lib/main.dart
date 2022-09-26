import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_cubit/cubits/counter/counter_cubit.dart';
import 'package:working_with_cubit/view/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: MyHomePage(),
      ),
    );
  }
}
