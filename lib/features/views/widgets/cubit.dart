import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestCubit {
  final String text;
  final Color color;
  final int count;

  TestCubit({required this.text, required this.color, required this.count});

  TestCubit copyWith({String? text, Color? color, int? count}) {
    return TestCubit(
      text: text ?? this.text,
      color: color ?? this.color,
      count: count ?? this.count,
    );
  }
}

class TestCubitStates extends Cubit<TestCubit> {
  TestCubitStates() : super(TestCubit(text: "Welcome", color: Colors.blue, count: 0));

  void updateState() {
    final newText = state.text == "Welcome" ? "Nourhan Elhamy" : "Welcome";
    final newColor = state.color == Colors.blue ? Colors.red : Colors.blue;
    final newCount = state.count + 1;

    emit(state.copyWith(
      text: newText,
      color: newColor,
      count: newCount,
    ));
  }
}
