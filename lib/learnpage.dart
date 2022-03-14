import 'package:flutter/material.dart';
import 'package:surya_namaskar/posedetails.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = PoseList();
    data.initializePoses();

    return Scaffold(
      appBar: AppBar(title: const Text('Learn more'),),
      body: ListView.builder(
          itemCount: data.poses.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                index > 0 ? Divider() : Container(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${index+1}. ${data.poses[index].name}'
                        ,style: Theme.of(context).textTheme.headline4),
                    ),
                  ]
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data.poses[index].process,
                      style: Theme.of(context).textTheme.headline6),
                ),
                PoseImage(data.poses[index]),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Benefits', style: Theme.of(context).textTheme.headline5)
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data.poses[index].benefits,
                      style: Theme.of(context).textTheme.headline6),
                ),
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Precautions', style: Theme.of(context).textTheme.headline5)
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data.poses[index].precaution,
                      style: Theme.of(context).textTheme.headline6),
                ),
              ]
            );
          }
      )
    );
  }
}

class PoseImage extends StatefulWidget {
  final PoseDetails poseDetails;

  const PoseImage(this.poseDetails, {Key? key}) : super(key: key);

  @override
  State<PoseImage> createState() => _PoseImageState();
}

class _PoseImageState extends State<PoseImage> {
  late TransformationController controller = TransformationController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TapDownDetails? tapDownDetails;
  @override
  Widget build(BuildContext context) {
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
          ..scaled(scale);

        print('$x,$y');

        controller.value = zoomed;
      },
      child: InteractiveViewer(
        clipBehavior: Clip.none,
        transformationController: controller,
        panEnabled: false,
        scaleEnabled: false,
        child: Image(
            image: AssetImage(widget.poseDetails.image)
        ),
      ),
    );
  }
}
