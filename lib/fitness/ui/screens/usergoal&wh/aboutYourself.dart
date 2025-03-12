import 'package:flutter/material.dart';
import '../../../ui/widgets/yourselfappbartitle.dart';
import '../../../utils/routes.dart';

import '../../theme/colors.dart';

class AboutYourself extends StatefulWidget {
  const AboutYourself({Key? key}) : super(key: key);

  @override
  State<AboutYourself> createState() => _AboutYourselfState();
}

class _AboutYourselfState extends State<AboutYourself>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _buttonanimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _buttonanimation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.decelerate));

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  int currentindex = 0;
  Widget _buildtitle() {
    return SlideTransition(
      position: _buttonanimation,
      child: CustomeYourselfappbar(
          title: "Tell about your self",
          substring:
              "to give you a better expreince and results \n we  need  to know  your gender "),
    );
  }

  Widget selectgender({
    required String gendertype,
    required IconData gendericontype,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentindex = index;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        alignment: Alignment.center,
        //width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color:
                      index == currentindex ? Colors.orangeAccent : Colors.grey,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == currentindex
                          ? Colors.orange
                          : Color(0xff181d24),
                    ),
                    child: Icon(
                      gendericontype,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    gendertype,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ),
            index == currentindex
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width * 0.45,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.orange),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildbutton() {
    return SlideTransition(
      position: _buttonanimation,
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor, shape: BoxShape.circle),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.yourselfage);
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                )),
          )

          /*CustomeRoundedButton(
          title: "Continue",
          width: MediaQuery.of(context).size.width * 0.85,
          hight: MediaQuery.of(context).size.height * 0.07,
          ontap: () {
            Navigator.of(context).pushNamed(Routes.yourselfage);
          },
          buttonmargin: true,
        ),*/
          ),
    );
  }

  Widget _buildgenderbutton() {
    return SlideTransition(
      position: _buttonanimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          selectgender(
            gendertype: "male",
            gendericontype: Icons.male,
            index: 0,
          ),
          selectgender(
            gendertype: "female",
            gendericontype: Icons.female,
            index: 1,
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildtitle(),
          _buildgenderbutton(),
          _buildbutton(),
        ],
      ),
    );
  }
}
