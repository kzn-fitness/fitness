import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/fitness/bloc/user/user_bloc.dart';
import 'package:fitness_app/fitness/bloc/user_input/user_input_bloc.dart';
import 'package:fitness_app/fitness/repository/user_repository.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'ui/theme/appTheme.dart';
import 'ui/theme/themeCubit.dart';
import 'utils/routes.dart';

class Fitnessmain extends StatefulWidget {
  final UserRepository userRepository;
  const Fitnessmain({super.key, required this.userRepository});

  @override
  State<Fitnessmain> createState() => _FitnessmainState();
}

class _FitnessmainState extends State<Fitnessmain> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: widget.userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider(create: (_) => UserInputBloc()),
          BlocProvider(
              create: (_) => UserBloc(userRepository: widget.userRepository)
                ..add(SubscribeUsermanager()))
        ],
        child: Builder(
          builder: (context) {
            final currenttheme = context.watch<ThemeCubit>().state.appTheme;
            return MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              navigatorObservers: [FlutterSmartDialog.observer],
              builder: FlutterSmartDialog.init(),
              theme: appThemeData[currenttheme],
              initialRoute:
                  user == null ? Routes.splash : Routes.fitnesshomepage,
              onGenerateRoute: Routes.onGenetate,
            );
          },
        ),
      ),
    );
  }
}
