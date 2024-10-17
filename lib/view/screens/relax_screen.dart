import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eye_relax_watch_app/blocs/relax_bloc.dart';
import 'package:eye_relax_watch_app/view/widgets/dashed_circular_relax_progress.dart';

import '../widgets/relax_text_widget.dart';
import '../widgets/background_mesh_gradient_widget.dart';
import '../widgets/slide_buttom_widget.dart';

class RelaxScreen extends StatefulWidget {
  const RelaxScreen({super.key});

  @override
  State<RelaxScreen> createState() => _RelaxScreenState();
}

class _RelaxScreenState extends State<RelaxScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RelaxBloc, RelaxState>(
      listener: (context, state) {
        if (state is RelaxInProgress) {
          // Start the timer when the state changes to RelaxInProgress
          Future.delayed(const Duration(seconds: 20), () {
            if (context.mounted) {
              context.read<RelaxBloc>().add(RelaxEventFinished());
            }
          });
        }
      },
      builder: (context, state) {
        if (state is RelaxInitial) {
          return Stack(
            alignment: Alignment.center,
            children: [
              const BackgroundMeshGradientWidget(),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "It's time to relax your eyes",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Let's Start!",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      letterSpacing: 0.5,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SlidingButtonWidget(
                "Start",
                    () => context.read<RelaxBloc>().add(RelaxStartButtonTapped()),
              ),
            ],
          );
        }
        else if (state is RelaxInProgress) {
          return const Stack(
            alignment: Alignment.center,
            children: [
              BackgroundMeshGradientWidget(),
              RelaxTextWidget(),
              DashedCircularRelaxProgress(),
            ],
          );
        } else if (state is RelaxSuccess) {
          return Stack(
            alignment: Alignment.center,
            children: [
              const BackgroundMeshGradientWidget(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  letterSpacing: 0.5,
                  color: Colors.white,
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FadeAnimatedText("Well done!"),
                  ],
                ),
              ),
              SlidingButtonWidget(
                "Repeat",
                    () => context.read<RelaxBloc>().add(RelaxEventStarted()),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
