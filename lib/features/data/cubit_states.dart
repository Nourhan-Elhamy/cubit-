import 'package:bloc/bloc.dart';
import 'package:cubit_task/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void reset() => emit(0);
}

class BackgroundCubit extends Cubit<String> {
  BackgroundCubit() : super(APPImages.image);

  void changeBackground(String path) => emit(path);
}

