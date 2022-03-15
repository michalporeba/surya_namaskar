import 'package:flutter/material.dart';
import 'package:surya_namaskar/posedetails.dart';
import 'package:surya_namaskar/yogabutton.dart';
import 'common.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Practice'),),
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
  TapDownDetails? tapDownDetails;
  late PoseDetails currentPose = data.poses[1];
  late Illustration illustration;
  int currentStep = -1;

  @override 
  void initState() {
    super.initState();
    _loadPose(currentPose);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [InteractiveViewer(
        constrained: false,
        clipBehavior: Clip.none,
        transformationController: controller,
        panEnabled: true,
        scaleEnabled: true,
        minScale: 0.1,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.lighten),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(Colors.orange.withOpacity(0.5), BlendMode.colorBurn),
            child: Image(
              image: AssetImage(illustration.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Padding(
            padding: const EdgeInsets.all(padding),
            child: Text(currentPose.name, style: Theme.of(context).textTheme.headline2),
          ),
          Spacer(),
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
      _loadPose(data.poses[currentStep % 12 + 2]);
    } else {
      _loadPose(data.poses[1]);
    }
  }

  void _goBack() => _setStep(currentStep -1);
  void _goForward() => _setStep(currentStep +1);

  void _loadPose(PoseDetails pose) {
    data = PoseList()..initializePoses();

    setState(() {
      currentPose = pose;
      illustration = pose.illustrations[currentStep ~/ 12 % pose.illustrations.length];
    });

    if (pose.illustrations.isNotEmpty) {
      controller.value = controller.value = Matrix4.identity()
        ..translate(illustration.offsetX, illustration.offsetY)
        ..scale(illustration.zoom);
    }

  }
}

