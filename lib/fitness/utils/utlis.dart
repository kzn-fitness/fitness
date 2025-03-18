import 'package:fitness_app/fitness/service/fitness_target_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/detailscreevideo.dart';
import '../model/usergoal.dart';
import '../model/workout.dart';

class fitnessUiUtils {
  static String getImagePath(String imageName) {
    return "assets/images/fullApps/fitness/$imageName";
  }

  static List<usergoal> goalList = [
    usergoal(id: Goal.getFitter, goalname: "Get Fitter"),
    usergoal(id: Goal.gainWeight, goalname: "Gain Weight"),
    usergoal(id: Goal.loseWeight, goalname: "Lose  Weight"),
    usergoal(id: Goal.buildingMuscles, goalname: "Building Muscles"),
    usergoal(id: Goal.improvingEndurance, goalname: "improving Endurance"),
    usergoal(id: Goal.other, goalname: "other"),
  ];
  static List levelList = [
    "Beginner",
    "Intermediate",
    "Advanced",
  ];
  static List<Workout> workout = [
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("featured_1.jpg"),
      id: "0",
      imageurl: [
        fitnessUiUtils.getImagePath("featured_1.jpg"),
        fitnessUiUtils.getImagePath("featured_2.jpg"),
        fitnessUiUtils.getImagePath("featured_3.jpg"),
      ],
      title: "Extended Side Angle",
      duration: "15 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("featured_2.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("featured_2.jpg"),
        fitnessUiUtils.getImagePath("featured_1.jpg"),
        fitnessUiUtils.getImagePath("featured_3.jpg"),
      ],
      title: "Warrior",
      duration: "20 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("featured_1.jpg"),
      id: "2",
      imageurl: [
        fitnessUiUtils.getImagePath("featured_1.jpg"),
        fitnessUiUtils.getImagePath("featured_2.jpg"),
        fitnessUiUtils.getImagePath("featured_3.jpg"),
      ],
      title: "Triangle Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("featured_4.jpg"),
      id: "3",
      imageurl: [
        fitnessUiUtils.getImagePath("featured_4.jpg"),
        fitnessUiUtils.getImagePath("featured_3.jpg"),
        fitnessUiUtils.getImagePath("featured_2.jpg"),
      ],
      title: "Mountain Pose",
      duration: "5 min",
      level: "Intermediat",
      bookmark: true,
    ),
  ];

  static List<Workout> beginnerworkout = [
    Workout(
      videourl: fitnessUiUtils.getImagePath("video.mp4"),
      image: fitnessUiUtils.getImagePath("beginner_1.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Downward Facing Dog",
      duration: "8 min",
      level: "Beginner",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_2.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Mountain Pose",
      duration: "15 min",
      level: "Beginner",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_3.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
      ],
      title: "Warrior",
      duration: "12 min",
      level: "Beginner",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_4.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_4.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
      ],
      title: "Extended Side Angle",
      duration: "10 min",
      level: "Beginner",
      bookmark: true,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_5.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_5.jpg"),
        fitnessUiUtils.getImagePath("beginner_4.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Triangle Pose ",
      duration: "10 min",
      level: "Beginner",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_1.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Standing Forward Bend",
      duration: "10 min",
      level: "Beginner",
      bookmark: true,
    ),
  ];
  static List<Workout> intermemediateworkout = [
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Intermediate_4.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Intermediate_4.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_3.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_2.jpg"),
      ],
      title: "Mountain Pose",
      duration: "20 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Intermediate_3.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Intermediate_3.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_2.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_1.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_4.jpg"),
      ],
      title: "Chair Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Intermediate_2.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Intermediate_2.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_1.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_3.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_4.jpg"),
      ],
      title: "Down Dog on a chair",
      duration: "10 min",
      level: "Intermediat",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Intermediate_1.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Intermediate_1.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_2.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_3.jpg"),
        fitnessUiUtils.getImagePath("Intermediate_4.jpg"),
      ],
      title: "Downward-Facing Dog",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
  ];

  static List<Workout> advanworkout = [
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_7.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_7.jpg"),
        fitnessUiUtils.getImagePath("Advanced_6.jpg"),
        fitnessUiUtils.getImagePath("Advanced_5.jpg"),
      ],
      title: "Triangle Pose",
      duration: "15 min",
      level: "advanced",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_6.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_6.jpg"),
        fitnessUiUtils.getImagePath("Advanced_5.jpg"),
        fitnessUiUtils.getImagePath("Advanced_4.jpg"),
      ],
      title: "Tree Pose",
      duration: "20 min",
      level: "advanced",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_5.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_5.jpg"),
        fitnessUiUtils.getImagePath("Advanced_4.jpg"),
        fitnessUiUtils.getImagePath("Advanced_3.jpg"),
      ],
      title: "Bridge Pose",
      duration: "25 min",
      level: "advanced",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_4.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_4.jpg"),
        fitnessUiUtils.getImagePath("Advanced_3.jpg"),
        fitnessUiUtils.getImagePath("Advanced_2.jpg"),
      ],
      title: "Bound Ankle Pose",
      duration: "30 min",
      level: "advanced",
      bookmark: true,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_3.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_3.jpg"),
        fitnessUiUtils.getImagePath("Advanced_2.jpg"),
        fitnessUiUtils.getImagePath("Advanced_1.jpg"),
      ],
      title: "Seated Forward Fold",
      duration: "5 min",
      level: "advanced",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_2.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_2.jpg"),
        fitnessUiUtils.getImagePath("Advanced_1.jpg"),
        fitnessUiUtils.getImagePath("Advanced_8.jpg"),
      ],
      title: "Corpse Pose",
      duration: "15 min",
      level: "advanced",
      bookmark: false,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("Advanced_1.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("Advanced_1.jpg"),
        fitnessUiUtils.getImagePath("Advanced_5.jpg"),
        fitnessUiUtils.getImagePath("Advanced_8.jpg"),
      ],
      title: "Four-Limbed Staff Pose",
      duration: "3 min",
      level: "advanced",
      bookmark: false,
    ),
  ];

  static List<Videodata> workoutvideo = [
    Videodata(
      id: "0",
      title: "warrior 1",
      imageurl: fitnessUiUtils.getImagePath("Advanced_1.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Videodata(
      id: "1",
      title: "slide Plank",
      imageurl: fitnessUiUtils.getImagePath("Advanced_2.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Videodata(
      id: "2",
      title: "TWISTED POSE",
      imageurl: fitnessUiUtils.getImagePath("Advanced_2.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Videodata(
      id: "0",
      title: "CRANE POSE",
      imageurl: fitnessUiUtils.getImagePath("Advanced_3.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Videodata(
      id: "1",
      title: "SPLIT POSE",
      imageurl: fitnessUiUtils.getImagePath("Advanced_4.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ),
    Videodata(
      id: "2",
      title: "SCORPION POSE",
      imageurl: fitnessUiUtils.getImagePath("Advanced_6.jpg"),
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    )
  ];
  static List<Workout> finishlist = [
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_2.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Camel Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_1.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Side plank",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_3.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
        fitnessUiUtils.getImagePath("beginner_1.jpg"),
      ],
      title: "Revolved Triangle Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_4.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_4.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
        fitnessUiUtils.getImagePath("beginner_2.jpg"),
      ],
      title: " Boat Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
  ];

  static List<Workout> BOOKMARKlIST = [
    Workout(
      videourl:
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      image: fitnessUiUtils.getImagePath("beginner_5.jpg"),
      id: "1",
      imageurl: [
        fitnessUiUtils.getImagePath("beginner_5.jpg"),
        fitnessUiUtils.getImagePath("beginner_4.jpg"),
        fitnessUiUtils.getImagePath("beginner_3.jpg"),
      ],
      title: "Camel Pose",
      duration: "10 min",
      level: "Intermediat",
      bookmark: true,
    ),
  ];
  static backNextButton(
      {required BuildContext context, required VoidCallback next}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              )),
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {
                next();
              },
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              )),
        )
        /*  CustomeRoundedButton(
              title: "Back",
              width: MediaQuery.of(context).size.width * 0.40,
              hight: MediaQuery.of(context).size.width * 0.15,
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
              hight: MediaQuery.of(context).size.width * 0.15,
              ontap: () {
                Navigator.of(context).pushNamed(Routes.yourselfweight);
              },
              buttonmargin: true,
            ),*/
      ],
    );
  }
}

String changeGoalEnumToString(Goal goal) {
  switch (goal) {
    case Goal.getFitter:
      return "getFitter";
    case Goal.gainWeight:
      return "gainWeight";
    case Goal.loseWeight:
      return "loseWeight";
    case Goal.buildingMuscles:
      return "buildingMuscles";
    case Goal.improvingEndurance:
      return "improvingEndurance";
    case Goal.other:
      return "others";
  }
}
