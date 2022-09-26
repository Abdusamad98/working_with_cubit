import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_cubit/cubits/calculator/calculator_cubit.dart';
import 'package:working_with_cubit/cubits/counter/counter_cubit.dart';
import 'package:working_with_cubit/view/calculator_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Working With Cubit"),
      ),
      body: BlocBuilder<CounterCubit, int>(
        //context.watch<CounterCubit>().state
        builder: (context, state) {
          return Center(
            child: Text("My number value:$state"),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => CalculatorCubit(),
                    child: CalculatorPage(),
                  ),
                ),
              );
            },
            child: const Icon(Icons.navigate_before),
          ),
        ],
      ),
    );
  }
}
