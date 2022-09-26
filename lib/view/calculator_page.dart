import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_cubit/cubits/calculator/calculator_cubit.dart';
import 'package:working_with_cubit/cubits/calculator/calculator_state.dart';
import 'package:working_with_cubit/cubits/counter/counter_cubit.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Working With Cubit"),
      ),
      body: BlocBuilder<CalculatorCubit, CalculatorState>(
        //context.watch<CounterCubit>().state
        builder: (context, state) {
          if (state is CalculatorInitialState) {
            return const Center(
              child: Text("Hali hisoblanmadi"),
            );
          } else if (state is AdditionResultState) {
            return Center(
              child: Text("Yig'indining qiymati:${state.result}"),
            );
          } else if (state is SubtractionResultState) {
            return Center(
              child: Text("Ayrimaning qiymati:${state.result}"),
            );
          } else if (state is MultiplyResultState) {
            return Center(
              child: Text("Ko'paymaning qiymati:${state.result}"),
            );
          } else if (state is DivisionResultState) {
            return Center(
              child: Text("Bo'linmaning qiymati:${state.result}"),
            );
          }
          return SizedBox();
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CalculatorCubit>().addNumbers(10, 20),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () =>
                context.read<CalculatorCubit>().subtractNumbers(20, 20),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () =>
                context.read<CalculatorCubit>().multiplyNumbers(20, 20),
            child: const Icon(Icons.ac_unit_rounded),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () =>
                context.read<CalculatorCubit>().divisionNumbers(20, 20),
            child: const Icon(Icons.scuba_diving),
          ),
        ],
      ),
    );
  }
}
