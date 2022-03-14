import 'package:flutter/material.dart';
import 'package:surya_namaskar/posedetails.dart';

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
  final PoseList data = PoseList()..initializePoses();
  late TransformationController controller = TransformationController();
  TapDownDetails? tapDownDetails;
  late PoseDetails currentPose = data.poses[1];
  late Illustration illustration;

  @override 
  void initState() {
    super.initState();
    controller.value = Matrix4.identity()..translate(-520.0, -0.0)..scale(0.21);
    _loadPose(currentPose);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
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
    );
  }

  void _loadPose(PoseDetails pose) {
    setState(() {
      currentPose = pose;
      illustration = pose.illustrations.first;
    });

    if (pose.illustrations.isNotEmpty) {
      controller.value = controller.value = Matrix4.identity()
        ..translate(illustration.offsetX, illustration.offsetY)
        ..scale(illustration.zoom);
    }

  }
}

