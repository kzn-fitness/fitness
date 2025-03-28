import 'dart:ui';

import 'package:fitness_app/fitness/service/fitness_target_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/user_input/user_input_bloc.dart';
import '../../../ui/widgets/yourselfappbartitle.dart';
import '../../../utils/routes.dart';

import '../../../utils/utlis.dart';
import '../../theme/colors.dart';

class AboutyouselfHeight extends StatefulWidget {
  const AboutyouselfHeight({Key? key}) : super(key: key);

  @override
  State<AboutyouselfHeight> createState() => _AboutyouselfHeightState();
}

class _AboutyouselfHeightState extends State<AboutyouselfHeight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _buttonanimation;
  late Animation<Offset> _titleanimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _buttonanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInExpo));
    _titleanimation = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInExpo));
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildappbar() {
    return Align(
      alignment: Alignment.topCenter,
      child: SlideTransition(
        position: _titleanimation,
        child: CustomeYourselfappbar(
            title: "What is Your Height",
            substring:
                "Height in cm. Don't worry, you can always \n change it later."),
      ),
    );
  }

  Widget _buildagetext() {
    return SizeTransition(
        sizeFactor: _controller,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: BlocBuilder<UserInputBloc, UserInputState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<UserInputBloc>()
                              .add(ChangeHeightUnit(heightUnit: HeightUnit.cm));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            color: state.heightUnit == HeightUnit.cm
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                              child: Text(
                            "cm",
                            style: TextStyle(
                                color: state.heightUnit == HeightUnit.cm
                                    ? Colors.white
                                    : Theme.of(context).primaryColor),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<UserInputBloc>()
                              .add(ChangeHeightUnit(heightUnit: HeightUnit.ft));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            color: state.heightUnit == HeightUnit.ft
                                ? Theme.of(context).primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                              child: Text(
                            "ft",
                            style: TextStyle(
                                color: state.heightUnit == HeightUnit.ft
                                    ? Colors.white
                                    : Theme.of(context).primaryColor),
                          )),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: CupertinoPicker(
                scrollController: FixedExtentScrollController(initialItem: 20),
                itemExtent: 50,
                useMagnifier: true,
                magnification: 2,
                diameterRatio: 2,
                children: List<Widget>.generate(
                    98,
                    (index) => Center(
                          child: Text(
                            '${index + 2}',
                            style: TextStyle(color: Colors.white, fontSize: 26),
                          ),
                        )),
                onSelectedItemChanged: (item) {
                  context.read<UserInputBloc>().add(ChangeHeight(height: item));
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildbutton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
          position: _buttonanimation,
          child: fitnessUiUtils.backNextButton(
              context: context,
              next: () {
                Navigator.of(context).pushNamed(Routes.yourselfgoal);
              })

          /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomeRoundedButton(
              title: "Back",
              width: MediaQuery.of(context).size.width * 0.40,
              hight: MediaQuery.of(context).size.width * 0.13,
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
              hight: MediaQuery.of(context).size.width * 0.13,
              ontap: () {
                Navigator.of(context).pushNamed(Routes.yourselfgoal);
              },
              buttonmargin: true,
            ),
          ],
        ),*/
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColor().background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildappbar(),
          _buildagetext(),
          _buildbutton(),
        ],
      ),
    );
  }
}
