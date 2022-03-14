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
  late TransformationController controller = TransformationController();
  TapDownDetails? tapDownDetails;
  final data = PoseList()..initializePoses();

  @override 
  void initState() {
    super.initState();
    controller.value = Matrix4.identity()..translate(-520.0, -0.0)..scale(0.21);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //controller.value = Matrix4.identity()..scale(1);
    return GestureDetector(
      onDoubleTapDown: (details) => tapDownDetails = details,
      onDoubleTap: () {
        print('doubletap');
        print(tapDownDetails!.localPosition);
        final position = tapDownDetails!.localPosition;
        final double scale = 3;
        final x = -position.dx * (scale - 1);
        final y = -position.dy * (scale - 1);
        final zoomed = Matrix4.identity()
          ..translate(x,y)
          ..scale(scale);

        print('$x,$y');

        controller.value = zoomed;
      },
      child: InteractiveViewer(
        constrained: false,
        clipBehavior: Clip.none,
        transformationController: controller,
        panEnabled: true,
        scaleEnabled: true,
        onInteractionUpdate: (details) {
          print(details);
        },
        minScale: 0.1,
        child: Image(
          image: AssetImage('images/pranamasana1.jpg'),
          fit: BoxFit.cover,
          // height: double.infinity,
          // width: double.infinity,
          // alignment: Alignment.center,
        ),
      ),
    );
  }

  void _loadPose(PoseDetails pose) {
    if (pose.illustrations.isNotEmpty) {

      controller.value = controller.value = Matrix4.identity()..translate(-520.0, -0.0)..scale(0.21);
    }

  }
}

