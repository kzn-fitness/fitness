import 'package:fitness_app/fitness/bloc/user_input/user_input_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ui/widgets/yourselfappbartitle.dart';
import '../../../utils/routes.dart';

import '../../../utils/utlis.dart';
import '../../theme/colors.dart';

class AboutyourSelfage extends StatefulWidget {
  const AboutyourSelfage({Key? key}) : super(key: key);

  @override
  State<AboutyourSelfage> createState() => _AboutyourSelfageState();
}

class _AboutyourSelfageState extends State<AboutyourSelfage>
    with TickerProviderStateMixin {
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

  int selectage = 0;
  Widget _buildappbar() {
    return Align(
      alignment: Alignment.topCenter,
      child: SlideTransition(
        position: _titleanimation,
        child: CustomeYourselfappbar(
            title: "How Old Are You?",
            substring:
                "Age in Years. This Will help  us to presonalize \n on exercise program plan that suits you."),
      ),
    );
  }

  Widget _buildagetext() {
    return Align(
      alignment: Alignment.center,
      child: SizeTransition(
          sizeFactor: _controller,
          child: SizedBox(
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
                context.read<UserInputBloc>().add(ChangeAge(age: item));
              },
            ),
          )),
    );
  }

  Widget _buildbutton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
          position: _buttonanimation,
          child: fitnessUiUtils.backNextButton(
              context: context,
              next: () {
                Navigator.of(context).pushNamed(Routes.yourselfweight);
              })),
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
