import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'endpage.dart';
import 'posedetails.dart';
import 'yogabutton.dart';
import 'common.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: PoseScreen()
        )
    );
  }
}

class PoseScreen extends StatefulWidget {
  const PoseScreen({Key? key}) : super(key: key);

  @override
  State<PoseScreen> createState() => _PoseScreenState();
}

class _PoseScreenState extends State<PoseScreen> {
  PoseList data = PoseList()..initializePoses();

  late TransformationController controller = TransformationController();
  late PoseDetails currentPose = data.poses[1];
  late int requestedDuration;
  late int requestedRepetitions;
  late Illustration illustration;
  late Timer timer;


  TapDownDetails? tapDownDetails;
  int currentStep = -1;
  bool isPaused = false;
  bool isStarted = false;
  int secondsRemaining = 10;
  bool helpMeBreathe = false;

  @override
  void initState() {
    super.initState();
    _loadPose(currentPose);

    SharedPreferences.getInstance().then((settings) {
      requestedRepetitions = settings.getInt(SETTINGS_REPETITIONS) ?? 1;
      requestedDuration = settings.getInt(SETTINGS_DURATION) ?? 10;
      helpMeBreathe = settings.getBool(SETTINGS_HELP_ME_BREATHE) ?? false;
      isStarted = true;
    });

    timer = new Timer.periodic(Duration(seconds:1), (Timer t) {
      if (!isStarted || isPaused) { return; }
      if (secondsRemaining > 1) {
        setState((){secondsRemaining--;});
      } else {
        setState((){secondsRemaining=requestedDuration;});
        _setStep(currentStep+1);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => setState(() {isPaused = true;}),
          child: InteractiveViewer(
            constrained: false,
            clipBehavior: Clip.none,
            transformationController: controller,
            panEnabled: true,
            scaleEnabled: true,
            minScale: 0.1,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(isPaused ? 0.4 : 0.2), BlendMode.lighten),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.orange.withOpacity(0.5), BlendMode.colorBurn),
                child: Image(
                  image: AssetImage(illustration.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            (isPaused)
              ? Row(children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: YogaButton(isPrimary: true, label: 'Stop', onPressed: (){
                  Navigator.pop(context);
                })
              ),
              Spacer(),
              Padding(
                  padding: const EdgeInsets.all(0),
                  child: YogaButton(isPrimary: true, label: 'Continue', onPressed: () => isPaused = false)
              )
            ])
              : Container(
                color: Colors.white.withOpacity(0.4),
                child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Padding(
                      padding: const EdgeInsets.only(left: padding),
                      child: Text(currentPose.name, style: Theme.of(context).textTheme.headline2)
                  ),),
                Spacer(),
                Padding(
                    padding: const EdgeInsets.all(padding),
                    child: Padding(
                      padding: const EdgeInsets.only(right: padding),
                      child: (!isStarted)
                        ? Container()
                        : Text('${secondsRemaining~/60}:${secondsRemaining.toString().padLeft(2,'0')}', style: Theme.of(context).textTheme.headline2),
                  )
                ),
          ]),
              ),
          (helpMeBreathe)
            ? Padding(
              padding: const EdgeInsets.symmetric(vertical: padding),
              child: Container(
                color: Theme.of(context).canvasColor.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: padding, horizontal: padding*2),
                  child: Text(currentPose.breathing, style: Theme.of(context).textTheme.headline2),
                ),
              ),
            )
            : Container(),
          Spacer(),
          Container(
            color: Theme.of(context).canvasColor.withOpacity(0.2),
            child: Padding(
            padding: const EdgeInsets.all(padding*1.5),
            child: Text('Image source: ${illustration.source}', style: Theme.of(context).textTheme.labelLarge),
            ),
          ),
          Row(
            children: [
              (currentStep >= 0) ? YogaButton(isPrimary: true, label: 'Previous', onPressed: _goBack) : Spacer(),
              Spacer(),
              YogaButton(isPrimary: true, label: 'Next', onPressed: _goForward)
            ]
          )
        ]
      )
    ]);
  }

  void _setStep(int step) {
    setState(() {
      currentStep = step;
    });
    if (currentStep >= 0) {
      if (currentStep >= requestedRepetitions * 22 + 1) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EndPage()));
      } else {
        _loadPose(data.poses[currentStep % 12 + 2]);
      }
    } else {
      _loadPose(data.poses[1]);
    }
  }

  void _goBack() {
    isPaused = true;
    _setStep(currentStep -1);
  }

  void _goForward() {
    isPaused = true;
    _setStep(currentStep + 1);
  }

  void _loadPose(PoseDetails pose) {
    data = PoseList()..initializePoses();

    setState(() {
      currentPose = pose;
      illustration = pose.illustrations[(currentStep ~/ 12 % pose.illustrations.length)];
    });

    // when loading the pose illustration, scale and offset it using default values
    if (pose.illustrations.isNotEmpty) {
      controller.value = controller.value = Matrix4.identity()
        ..translate(illustration.offsetX, illustration.offsetY)
        ..scale(illustration.zoom);
    }

  }
}

