import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eye_relax_watch_app/view/screens/relax_screen.dart';
import 'package:wear_plus/wear_plus.dart';
import 'package:eye_relax_watch_app/blocs/relax_bloc.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BlocProvider(
      create: (context) => RelaxBloc(),
      child: const HomeScreen(),
    ),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
          return const RelaxScreen();
        },
      ),
    );
  }
}
