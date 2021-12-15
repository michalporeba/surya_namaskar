import 'package:flutter/material.dart';
import 'package:surya_namaskar/posedetails.dart';

//This widget has the UI for the info button
//on a pose
//If a user is on a pose and clicks on the i button
//it opens up a page where it gives the details
//about the breathing, the benefits and the
//precautions that one might need to take
//while doing a pose
class PoseInfoPage extends StatelessWidget {
  final PoseDetails pose;
  PoseInfoPage({required this.pose});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pose.name + ' Details',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: const Text(
                          'Breathing:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Verdana',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          pose.breathing,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: const Text(
                          'Precautions:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Verdana',
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(
                            pose.precaution,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Arial',
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: const Text(
                          'Benefits:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Verdana',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          pose.benefits,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "infobtn",
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
