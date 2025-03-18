import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/user/user_bloc.dart';
import '../../../bloc/user_input/user_input_bloc.dart';
import '../../../model/UserManager.dart';
import '../../../service/fitness_target_service.dart';
import '../../../ui/widgets/customeBackbutton.dart';
import '../../../ui/widgets/customrRoundedButton.dart';
import '../../../ui/widgets/yourselfappbartitle.dart';
import '../../../utils/routes.dart';
import '../../../utils/utlis.dart';

import '../../theme/colors.dart';

class SignInMethodScreen extends StatefulWidget {
  const SignInMethodScreen({Key? key}) : super(key: key);

  @override
  State<SignInMethodScreen> createState() => _SignInMethodScreenState();
}

class _SignInMethodScreenState extends State<SignInMethodScreen>
    with TickerProviderStateMixin {
  late AnimationController _titlecontroller;

  late AnimationController _buttoncontroller;
  late Animation<Offset> _titleanimation;

  late Animation<Offset> _buttonanimation;

  @override
  void initState() {
    super.initState();

    _titlecontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _buttoncontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _titleanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _titlecontroller, curve: Curves.decelerate));
    _buttonanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _buttoncontroller, curve: Curves.decelerate));
    _buttoncontroller.forward();
    _titlecontroller.forward(from: 0.01);
  }

  @override
  void dispose() {
    super.dispose();

    _buttoncontroller.dispose();
  }

  Widget _builappbar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: _titleanimation,
        child: CustomeYourselfappbar(
          title: "Let's You In",
          titlesize: 35,
        ),
      ),
    );
  }

  Widget signincontainer(
      String MethodName, String methodimage, void Function()? onTap) {
    return SlideTransition(
      position: _titleanimation,
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white12,
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.05))),
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        fitnessUiUtils.getImagePath(methodimage),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  " Continue With $MethodName",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                      //letterSpacing: 1
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signinmethod() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          signincontainer("Facebook", "fb.png", () {}),
          signincontainer("Google", "google.png", () {
            //get usermanager
            final state = context.read<UserInputBloc>().state;
            final targets = FitnessTargetService.calculateTargets(
              state.goal,
              state.age,
              state.height + 0.0,
              state.weight + 0.0,
              state.gender,
              state.heightUnit,
              state.weightUnit,
            );
            final goalList =
                state.goal.map((g) => changeGoalEnumToString(g)).toList();
            final userManager = Usermanager(
              stepTarget: targets.stepTarget,
              caloriesBurnTarget: targets.caloriesBurnTarget,
              sleepTarget: targets.sleepTarget,
              goals: goalList,
            );
            context
                .read<UserBloc>()
                .add(SignInGoogle(usermanager: userManager));
          }),
          signincontainer("Apple", "apple.png", () {})
        ],
      ),
    );
  }

  Widget _buildbutton() {
    return Align(
      alignment: Alignment.center,
      child: SlideTransition(
        position: _buttonanimation,
        child: CustomeRoundedButton(
          title: "Sign In With Password",
          width: MediaQuery.of(context).size.width * 0.84,
          hight: MediaQuery.of(context).size.height * 0.07,
          borderradius: 35,
          fontsize: 14,
          buttonmargin: false,
          ontap: () {
            Navigator.of(context).pushNamed(Routes.signInscreen);
          },
        ),
      ),
    );
  }

  Widget _buildor() {
    return SlideTransition(
      position: _buttonanimation,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 1,
              //  width: 150,
              child: Divider(
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
          Text(
            "or",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: Colors.white),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 1,
              //   width: 150,
              child: Divider(
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildnoaccounttext() {
    return SlideTransition(
      position: _buttonanimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't Have Account?",
            style: TextStyle(color: Theme.of(context).colorScheme.background),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.signUpscreen);
            },
            child: Text(
              "Sign Up",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColor().background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.center,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomBackButton(),
              )),
          _builappbar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          signinmethod(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildor(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          _buildbutton(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: _buildnoaccounttext(),
            ),
          ),
          //_buildnoaccounttext(),
        ],
      ),
    );
  }
}
