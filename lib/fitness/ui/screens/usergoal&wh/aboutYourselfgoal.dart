import 'package:fitness_app/fitness/bloc/user_input/user_input_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ui/widgets/yourselfappbartitle.dart';
import '../../../utils/routes.dart';
import '../../../utils/utlis.dart';

import '../../theme/colors.dart';

class AboutYourselfGoal extends StatefulWidget {
  const AboutYourselfGoal({Key? key}) : super(key: key);

  @override
  State<AboutYourselfGoal> createState() => _AboutYourselfGoalState();
}

class _AboutYourselfGoalState extends State<AboutYourselfGoal>
    with TickerProviderStateMixin {
  late AnimationController _titlecontroller;

  late AnimationController _goalcontroller;
  late AnimationController _buttoncontroller;
  late Animation<Offset> _titleanimation;
  late Animation<Offset> _goalanimation;
  late Animation<Offset> _buttonanimation;

  @override
  void initState() {
    super.initState();

    _titlecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _goalcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _buttoncontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _titleanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _titlecontroller, curve: Curves.decelerate));
    _goalanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _goalcontroller, curve: Curves.decelerate));
    _buttonanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _buttoncontroller, curve: Curves.decelerate));
    _goalcontroller.forward();
    _buttoncontroller.forward();
    _titlecontroller.forward();
  }

  @override
  void dispose() {
    super.dispose();

    _buttoncontroller.dispose();
    _goalcontroller.dispose();
  }

  Widget _buildappbar() {
    return Align(
      alignment: Alignment.topCenter,
      child: SlideTransition(
        position: _titleanimation,
        child: CustomeYourselfappbar(
            title: "What is your Goal?",
            substring:
                "you can choose more than one. Don't\n worry, you can alawys change it late."),
      ),
    );
  }

  Widget _buildgoal() {
    return SlideTransition(
      position: _goalanimation,
      child: Container(
        margin: EdgeInsets.only(
          /*top: MediaQuery.of(context).size.height * 0.15,*/
          left: MediaQuery.of(context).size.width * 0.08,
          right: MediaQuery.of(context).size.width * 0.08,
        ),
        height: MediaQuery.of(context).size.height * 0.70,
        child: BlocBuilder<UserInputBloc, UserInputState>(
          builder: (context, state) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              //  padding: EdgeInsets.only(top: 50),
              itemCount: fitnessUiUtils.goalList.length,
              itemBuilder: (BuildContext context, int index) {
                final goal = fitnessUiUtils.goalList[index];
                return GestureDetector(
                  onTap: () {
                    context
                        .read<UserInputBloc>()
                        .add(ChangeGoal(goal: goal.id));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white10,
                      border: state.goal.contains(goal.id)
                          ? Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            )
                          : Border.all(width: 0, color: Colors.transparent),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      child: Row(
                        children: [
                          Text(
                            fitnessUiUtils.goalList[index].goalname,
                            style: TextStyle(
                                fontSize: 18,
                                color:
                                    Theme.of(context).colorScheme.background),
                          ),
                          Spacer(),
                          !state.goal.contains(goal.id)
                              ? Icon(
                                  Icons.circle_outlined,
                                  color: Theme.of(context).primaryColor,
                                )
                              : Icon(
                                  Icons.check_circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildbutton() {
    return SlideTransition(
        position: _buttonanimation,
        child: fitnessUiUtils.backNextButton(
            context: context,
            next: () {
              Navigator.of(context).pushNamed(Routes.yourselflevel);
            })
        /*Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomeRoundedButton(
            title: "Back",
            width: MediaQuery.of(context).size.width * 0.40,
            hight: MediaQuery.of(context).size.height * 0.08,
            containercolors: Theme.of(context).primaryColor.withOpacity(0.1),
            textcolor: Theme.of(context).primaryColor,
            ontap: () {
              Navigator.of(context).pop();
            },
            buttonmargin: true,
          ),
          CustomeRoundedButton(
            title: "Next",
            width: MediaQuery.of(context).size.width * 0.40,
            hight: MediaQuery.of(context).size.height * 0.08,
            ontap: () {
              Navigator.of(context).pushNamed(Routes.yourselflevel);
            },
            buttonmargin: true,
          ),
        ],
      ),*/
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColor().background,
      body: Column(
        children: [
          _buildappbar(),
          _buildgoal(),
          _buildbutton(),
        ],
      ),
    );
  }
}
