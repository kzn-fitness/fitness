import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/theme/appTheme.dart';
import 'ui/theme/themeCubit.dart';
import 'utils/routes.dart';

class Fitnessmain extends StatefulWidget {
  const Fitnessmain({Key? key}) : super(key: key);

  @override
  State<Fitnessmain> createState() => _FitnessmainState();
}

class _FitnessmainState extends State<Fitnessmain> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final currenttheme = context.watch<ThemeCubit>().state.appTheme;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appThemeData[currenttheme],
            initialRoute: Routes.splash,
            onGenerateRoute: Routes.onGenetate,
          );
        },
      ),
    );
  }
}
