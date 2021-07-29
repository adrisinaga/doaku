import 'package:doaku/utils/lib.dart';
import 'package:doaku/utils/color.dart';
import 'package:flutter/material.dart';

class NovenaTigaKaliSalamMariaScreen extends StatefulWidget {
  @override
  _NovenaTigaKaliSalamMariaScreenState createState() =>
      _NovenaTigaKaliSalamMariaScreenState();
}

class _NovenaTigaKaliSalamMariaScreenState
    extends State<NovenaTigaKaliSalamMariaScreen> {
  static int index = 0;
  static int currentStep = 0;
  bool complete = false;
  StepperType stepperType = StepperType.vertical;
  BuildContext context;

  static var spacer50 = SizedBox(height: 50);
  static var spacer10 = SizedBox(height: 10);

  List<Step> steps = [
    Step(
      title: Text(
        'Bunda Maria Perawan Berkuasa',
        style: styleTitle,
      ),
      isActive: getIsActive(0, index),
      state: StepState.indexed,
      content: Column(
        children: <Widget>[
          part1,
          spacer50,
          salamMaria3x,
          spacer10,
          ujudDoaKita,
          spacer10,
          bundaMariaBaikHatiJauhkanDariDosaBerat,
          spacer50,
          spacer50,
          part2,
          spacer50,
          salamMaria3x,
          spacer10,
          ujudDoaKita,
          spacer10,
          bundaMariaBaikHatiJauhkanDariDosaBerat,
          spacer50,
          spacer50,
          part3,
          spacer50,
          salamMaria3x,
          spacer10,
          ujudDoaKita,
          spacer10,
          bundaMariaBaikHatiJauhkanDariDosaBerat,
        ],
      ),
    ),
    Step(
      isActive: getIsActive(3, index),
      title: Text(
        'Bunda Maria',
        style: styleTitle,
      ),
      state: StepState.indexed,
      content: Column(
        children: <Widget>[
          bundaMaria,
        ],
      ),
    ),
    Step(
      isActive: getIsActive(4, index),
      title: Text(
        'Jiwa Maria',
        style: styleTitle,
      ),
      state: StepState.indexed,
      content: Column(
        children: <Widget>[
          jiwaMaria,
        ],
      ),
    ),
    Step(
      isActive: getIsActive(5, index),
      title: Text(
        'Permohonan Kepada Allah',
        style: styleTitle,
      ),
      state: StepState.indexed,
      content: Column(
        children: <Widget>[
          permohonanKpdAllah,
        ],
      ),
    ),
  ];

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() {
      currentStep = step;
    });
  }

  switchStepType() {
    setState(() {
      stepperType == StepperType.horizontal
          ? stepperType = StepperType.vertical
          : stepperType = StepperType.horizontal;
    });
  }

  static bool getIsActive(int currentIndex, int index) {
    if (currentStep <= index) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    context = context;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Tooltip(
            message: 'Back',
            child: Icon(
              Icons.arrow_back,
              color: AppColor.kYellow,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Novena Tiga Salam Maria",
          style: styleAppbar1,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColor.kBlue,
//            gradient: LinearGradient(
//              colors: [
//
//              ],
//              begin: FractionalOffset.topLeft,
//              end: FractionalOffset.bottomRight,
//            ),
          ),
        ),
      ),
      body: Column(
        children: [
          complete
              ? Expanded(
                  child: Center(
                    child: AlertDialog(
                      title: Text("Finish"),
                      content: Text("Amen"),
                      actions: [
                        FlatButton(
                          child: Text("Close"),
                          onPressed: () {
                            setState(() {
                              complete = false;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Stepper(
                    physics: BouncingScrollPhysics(),
                    steps: steps,
                    type: stepperType,
                    currentStep: currentStep,
                    onStepContinue: next,
                    onStepTapped: (step) {
                      goTo(step);
                      getIsActive(currentStep, step);
                    },
                    onStepCancel: cancel,
                    controlsBuilder: (BuildContext context,
                        {VoidCallback onStepContinue,
                        VoidCallback onStepCancel}) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.kYellow,
                          ),
                          child: FlatButton(
                              child: (currentStep == 5)
                                  ? Text("Finish")
                                  : Text("Next"),
                              onPressed: onStepContinue),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
