import 'package:flutter/material.dart';
import '../../../utils/fitnessconst.dart';
import '../../../utils/routes.dart';
import '../../../utils/utlis.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider>
    with TickerProviderStateMixin {
  final PageController pageController = PageController();
  int currentIndex = 0;
  late AnimationController _controller;
  late Animation<Offset> imageanimation;
  late Animation<Offset> textanimation;
  late Animation<Offset> buttinanimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    imageanimation =
        Tween<Offset>(begin: Offset(0.0, -2.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    );
    textanimation =
        Tween<Offset>(begin: Offset(0.0, 2.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    buttinanimation =
        Tween<Offset>(begin: Offset(0.0, 2.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    );
    _controller.forward();
  }

  Widget slider(String imagename, String text, int index) {
    return Stack(
      children: [
        SlideTransition(
          position: imageanimation,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              fitnessUiUtils.getImagePath(imagename),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .62),
          child: SlideTransition(
            position: textanimation,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 7,
      width: currentIndex == index ? 25 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentIndex == index
            ? Theme.of(context).colorScheme.background
            : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _builslistview() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      children: [
        slider("onboarding_1.jpg", intro1, 0),
        slider("onboarding_2.jpg", intro2, 1),
        slider("onboarding_3.jpg", intro3, 2),
      ],
    );
  }

  Widget _buildbutton() {
    return Container(
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(
          right: 20, bottom: MediaQuery.of(context).size.height * 0.1),
      child: SlideTransition(
        position: buttinanimation,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.yourself);
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
        )
        /*CustomeRoundedButton(
            title: "Next",
            width: MediaQuery.of(context).size.width * 0.85,
            hight: MediaQuery.of(context).size.height * 0.06,
            buttonmargin: true,
            ontap: () {
              Navigator.of(context).pushNamed(Routes.yourself);
            })*/
        ,
      ),
    );
  }

  Widget _dots() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
            left: 20, bottom: MediaQuery.of(context).size.height * 0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => buildDot(index, context),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Stack(
          children: [
            _builslistview(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dots(),
                Spacer(),
                _buildbutton(),
              ],
            )
          ],
        ));
  }
}
