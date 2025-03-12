import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../model/workout.dart';
import '../../../utils/routes.dart';
import '../../../utils/utlis.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../theme/colors.dart';

class Insightscreen extends StatefulWidget {
  const Insightscreen({Key? key}) : super(key: key);

  @override
  State<Insightscreen> createState() => _InsightscreenState();
}

class _InsightscreenState extends State<Insightscreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController _boxcontainer;
  late AnimationController _buttoncontroller;
  late Animation<Offset> _buttonanimation;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 700),
    );
    animationController.forward();
    _boxcontainer =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _buttoncontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _buttonanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _boxcontainer, curve: Curves.decelerate));
    // _buttonanimation = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
    //     .animate(CurvedAnimation(
    //         parent: _buttoncontroller, curve: Curves.decelerate));
    _buttoncontroller.forward();
    _boxcontainer.forward(from: 0.01);
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  late final _countdowncontroller = CountDownController();
  Widget _buildworkoutcontainer({
    required Workout workout,
    required double bottom,
    required double right,
    // ignore: unused_element
    double? hight,
    required double width,
    required Function ontap,
  }) {
    return InkWell(
      onTap: ontap as void Function()?,
      child: Container(
        margin: EdgeInsets.only(right: right, bottom: bottom),
        height: MediaQuery.of(context).size.height * 0.15,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: AssetImage(
                  workout.image,
                ),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.00),
                        Colors.black.withOpacity(0.00),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.5),
                      ],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workout.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${workout.duration}  |  ${workout.level}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              workout.bookmark
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildlevelworkoutlist() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          //scrollDirection: Axis.horizontal,
          itemCount: fitnessUiUtils.finishlist.length,
          itemBuilder: (BuildContext context, int index) {
            final fitnesslist = fitnessUiUtils.finishlist[index];
            return _buildworkoutcontainer(
                workout: fitnesslist,
                bottom: 15,
                right: 0,
                width: MediaQuery.of(context).size.width * 0.60,
                ontap: () {
                  Navigator.of(context).pushNamed(
                    Routes.workoutdetailscreen,
                    arguments: {"Model": fitnesslist},
                  );
                });
          },
        ),
      ),
    );
  }

  Widget _builddatetimepicker() {
    return FlutterDatePickerTimeline(
      startDate: DateTime.now(),
      endDate: DateTime(2025, 12, 30),
      initialSelectedDate: DateTime.now(),
      selectedItemMargin: EdgeInsets.zero,
      onSelectedDateChange: (DateTime? dateTime) {
        print(dateTime);
      },
    );

    /*DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.white,
      selectedTextColor: Colors.black,
      height: MediaQuery.of(context).size.height * 0.15,
      deactivatedColor: Colors.white70,
      dateTextStyle: TextStyle(color: Colors.white),
      monthTextStyle: TextStyle(color: Colors.white),
      dayTextStyle: TextStyle(color: Colors.white),
      onDateChange: (date) {
        // New date selected
        setState(() {
          _selectedValue = date;
        });
      },
    );*/
  }

  Widget _builcircularbar({
    required String title,
    required Color colors,
    required String subtitle,
    required double radius,
    required double percentage,
    required bool big,
  }) {
    return CircularPercentIndicator(
      animation: true,
      backgroundColor: Colors.white12,
      radius: radius,
      lineWidth: 10.0,
      percent: percentage,
      center: CircularPercentIndicator(
        animation: true,
        backgroundColor: Colors.white12,
        radius: MediaQuery.of(context).size.width / 7,
        lineWidth: 10.0,
        percent: 0.6,
        center: CircularPercentIndicator(
          animation: true,
          backgroundColor: Colors.white12,
          radius: MediaQuery.of(context).size.width / 11,
          lineWidth: 10.0,
          percent: 0.8,
          linearGradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              Colors.deepPurpleAccent.withOpacity(0.5),
              Colors.deepPurpleAccent.withOpacity(0.8),
            ],
          ),
          rotateLinearGradient: true,
          circularStrokeCap: CircularStrokeCap.round,
        ),
        linearGradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            Colors.red.withOpacity(0.5),
            Colors.red.withOpacity(0.8),
          ],
        ),
        rotateLinearGradient: true,
        circularStrokeCap: CircularStrokeCap.round,
      ),
      linearGradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: <Color>[
          colors.withOpacity(0.5),
          colors.withOpacity(0.8),
        ],
      ),
      rotateLinearGradient: true,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }

  Widget buildtext() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Finished  Workouts",
          style: TextStyle(color: Theme.of(context).colorScheme.background),
        ),
        Spacer(),
        TextButton(
            onPressed: () {},
            child: Text(
              "See All",
              style: TextStyle(color: Theme.of(context).colorScheme.background),
            ))
      ],
    );
  }

  Widget _buildappbar() {
    return Row(
      children: [
        Image.asset(
          "assets/images/fullApps/fitness/smalllogo.png",
          height: 40,
          width: 40,
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "GoFIt",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }

  List<_SalesData> data = [
    _SalesData(2, 1000),
    _SalesData(4, 2000),
    _SalesData(6, 4000),
    _SalesData(8, 6000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FitnessColor().background,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            children: [
              SlideTransition(
                  position: _buttonanimation, child: _buildappbar()),
              SlideTransition(
                  position: _buttonanimation, child: _builddatetimepicker()),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              SlideTransition(
                position: _buttonanimation,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _builcircularbar(
                          radius: MediaQuery.of(context).size.width * 0.20,
                          colors: Colors.greenAccent,
                          title: "950",
                          subtitle: "Cal",
                          big: true,
                          percentage: 0.75),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "72 % Steps",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.background),
                          ),
                          Text(
                            "36 % Calories",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.background),
                          ),
                          Text(
                            "91 % Sleep time",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.background),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "  Total",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Day  ",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      SfCartesianChart(series: [
                        // Renders column chart
                        ColumnSeries<_SalesData, double>(
                            dataSource: data,
                            xValueMapper: (_SalesData data, _) => data.total,
                            color: Colors.greenAccent,
                            xAxisName: "Total",
                            yValueMapper: (_SalesData data, _) => data.days)
                      ]),
                    ],
                  )),
              /*  SlideTransition(
                  position: _buttonanimation, child: _buildlistofcircular()),*/
              SlideTransition(
                position: _buttonanimation,
                child: buildtext(),
              ),
              SlideTransition(
                position: _buttonanimation,
                child: _buildlevelworkoutlist(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.total, this.days);

  final double total;
  final double days;
}
