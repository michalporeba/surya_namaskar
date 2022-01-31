import 'package:flutter/material.dart';
import 'package:surya_namaskar/posedetails.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = PoseList();
    data.initializePoses();

    return Scaffold(
      appBar: AppBar(title: const Text('Learn'),),
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
                Image(
                    image: AssetImage(data.poses[index].image)
                ),
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
