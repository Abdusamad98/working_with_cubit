abstract class CalculatorState {
  CalculatorState();
}

class CalculatorInitialState extends CalculatorState {}

class AdditionResultState extends CalculatorState {
  final double result;

  AdditionResultState({required this.result});
}

class SubtractionResultState extends CalculatorState {
  final double result;

  SubtractionResultState({required this.result});
}

class MultiplyResultState extends CalculatorState {
  final double result;

  MultiplyResultState({required this.result});
}

class DivisionResultState extends CalculatorState {
  final double result;

  DivisionResultState({required this.result});
}

class UniversalState extends CalculatorState {
  final double result;

  UniversalState({required this.result});
}
