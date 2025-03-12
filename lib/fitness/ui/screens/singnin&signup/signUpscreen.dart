import 'package:flutter/material.dart';
import '../../../ui/widgets/customeBackbutton.dart';
import '../../../ui/widgets/customrRoundedButton.dart';
import '../../../ui/widgets/yourselfappbartitle.dart';
import '../../../utils/routes.dart';
import '../../../utils/utlis.dart';

import '../../theme/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  bool value = false;

  late AnimationController animationController;
  late AnimationController _titlecontroller;
  late AnimationController _buttoncontroller;
  late Animation<Offset> _titleanimation;

  late Animation<Offset> _buttonanimation;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 700),
    );
    animationController.forward();
    _titlecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _buttoncontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _titleanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _titlecontroller, curve: Curves.decelerate));
    _buttonanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _buttoncontroller, curve: Curves.decelerate));
    _buttoncontroller.forward();
    _titlecontroller.forward(from: 0.01);
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget _builappbar() {
    return SlideTransition(
      position: _titleanimation,
      child: CustomeYourselfappbar(
        title: "Create Your \n Account",
        titlesize: 40,
        crossAxisAlignment: CrossAxisAlignment.start,
        letterspacing: 1.2,
      ),
    );
  }

  Widget _buildemailcontainer() {
    return SlideTransition(
      position: _titleanimation,
      child: TextField(
        //textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.background,
        ),
        decoration: InputDecoration(
            fillColor: Colors.white12,
            filled: true,
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintStyle: TextStyle(
              color: Theme.of(context).canvasColor,
            ),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Theme.of(context).canvasColor,
            )),
      ),
    );
  }

  Widget _buildpassword() {
    return SlideTransition(
      position: _titleanimation,
      child: TextField(
        //textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.background,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white12,
          filled: true,
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintStyle: TextStyle(
            color: Theme.of(context).canvasColor,
          ),
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Theme.of(context).canvasColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove_red_eye,
              color: Theme.of(context).canvasColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buldremebercontainet() {
    return SlideTransition(
      position: _buttonanimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Theme(
            data: ThemeData(
              useMaterial3: false,
              primarySwatch: Colors.blue,
              unselectedWidgetColor: Colors.white70, // Your color
            ),
            child: Checkbox(
                activeColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                value: value,
                onChanged: (status) {
                  setState(() {
                    value = status!;
                  });
                }),
          ),
          Text(
            "Remember Me",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }

  Widget _buildSignUpButton() {
    return SlideTransition(
      position: _buttonanimation,
      child: CustomeRoundedButton(
        title: "Sign Up",
        width: MediaQuery.of(context).size.width * 0.90,
        hight: MediaQuery.of(context).size.height * 0.065,
        borderradius: 40,
        fontsize: 18,
      ),
    );
  }

  Widget _buildor() {
    return SlideTransition(
      position: _titleanimation,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 1,
              //  width: 150,
              child: Divider(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              ),
            ),
          ),
          Text(
            "or continue with",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 1,
              //   width: 150,
              child: Divider(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _roundedbuttonforsocialmedia(
      {required String imagename, Function? ontap}) {
    return SlideTransition(
      position: _buttonanimation,
      child: GestureDetector(
        onTap: ontap as void Function()?,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.070,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.withOpacity(0.1),
            ),
            // shape: BoxShape.circle,
          ),
          child: Image(
            image: AssetImage(
              fitnessUiUtils.getImagePath(imagename),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocalmediabutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _roundedbuttonforsocialmedia(imagename: "fb.png"),
        _roundedbuttonforsocialmedia(imagename: "google.png"),
        _roundedbuttonforsocialmedia(imagename: "apple.png"),
      ],
    );
  }

  Widget _buildnoaccounttext() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: TextStyle(color: Theme.of(context).colorScheme.background),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.signInscreen);
            },
            child: Text("Sign in"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColor().background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: CustomBackButton(),
            ),
            _builappbar(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            _buildemailcontainer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            _buildpassword(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            _buldremebercontainet(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            _buildSignUpButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            _buildor(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            _buildSocalmediabutton(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: _buildnoaccounttext(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
