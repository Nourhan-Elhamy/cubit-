import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<TestCubitStates, TestCubit>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.text,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 100,
                  width: 100,
                  color: state.color,
                ),
                const SizedBox(height: 20),
                Text(
                  "Count = ${state.count}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    context.read<TestCubitStates>().updateState();
                  },
                  child: const Text("Change State"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
