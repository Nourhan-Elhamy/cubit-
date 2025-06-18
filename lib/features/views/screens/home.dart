import 'package:cubit_task/core/app_images.dart';
import 'package:cubit_task/features/data/cubit_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final List<String> backgrounds =  [
    APPImages.image,
    APPImages.image2,
    APPImages.image,
    APPImages.image2,  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BackgroundCubit, String>(
        builder: (context, bgPath) {
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox.expand(
                child: Image.asset(
                  bgPath,
                  fit: BoxFit.cover,
                ),
              ),
              BlocBuilder<CounterCubit, int>(
                builder: (context, count) => Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.withOpacity(0.2),
                  ),
                  alignment: Alignment.center,
                  child: Text('$count',
                      style: const TextStyle(fontSize: 28, color: Colors.purple)),
                ),
              ),
              Positioned(
                right: 50,
                bottom: 200,
                child: GestureDetector(
                  onTap: () => context.read<CounterCubit>().increment(),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.fingerprint, color: Colors.purple),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                bottom: 200,
                child: GestureDetector(
                  onTap: () => context.read<CounterCubit>().reset(),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.replay, color: Colors.purple),
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                child: Row(
                  children: List.generate(backgrounds.length, (index) {
                    return GestureDetector(
                      onTap: () => context
                          .read<BackgroundCubit>()
                          .changeBackground(backgrounds[index]),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(backgrounds[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
