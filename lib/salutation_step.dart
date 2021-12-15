import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:surya_namaskar/about.dart';
import 'package:surya_namaskar/posedetails.dart';
import 'package:surya_namaskar/poseinfo.dart';

class SalutationPage extends StatefulWidget {
  SalutationPage({required this.poseList});
  final PoseList poseList;
  @override
  _SalutationPageState createState() => _SalutationPageState();
}

class _SalutationPageState extends State<SalutationPage> {
  bool prevButtonDisabled = true;
  bool nextButtonDisabled = false;
  int _totalPoses = 12;
  late List<PoseDetails> _poses;
  int _currentPageNo = 0;
  int _delayTime = 0;
  late Timer _delayTimer;

  //just making sure that the total number of poses
  //is retrieved from the list and not the hardcoded value
  //also need to get the list of poses from the list.
  //this is because if we change it later, it will not
  //affect the UI code (i.e. this page)
  @override
  void initState() {
    super.initState();
    _totalPoses = widget.poseList.poses.length;
    _poses = widget.poseList.poses;
  }

  //tells you what to do when we click on the -> next button
  //basically identify the next pose to navigate to
  //and if the timer is set, start the timer (for it to
  //auto navigate to the next page)
  //and update all the button status
  void gotoNextPage() {
    setState(() {
      if (_currentPageNo == (_totalPoses - 1)) {
        _currentPageNo = 0;
      } else {
        _currentPageNo++;
      }
      initDelayTimer();
      checkAndUpdateButtonStatus();
    });
  }

  //this is the timer code
  //we set the timer to a value between 0 and 15
  //(no real reason for that..just that it might take
  //15 secs to do a pose)
  //and then accordingly navigate to the next pose
  //and ensure that we do not loop through
  void initDelayTimer() {
    _delayTimer = new Timer(Duration(seconds: (_delayTime)), () {
      setState(() {});
      if (_delayTime != 0) {
        if (_currentPageNo > 0 && _currentPageNo < _totalPoses - 1) {
          gotoNextPage();
        }
      }
    });
  }

  //tells you what to do when you press <- prev button
  //just like the next button, need to ensure that the
  //change stops at the first pose and the buttons
  //are updated accordingly.
  //unlike the next button, this doesn't trigger the
  //timer in anyway.
  void gotoPrevPage() {
    setState(() {
      if (_currentPageNo == 0) {
        _currentPageNo = 0;
      } else {
        _currentPageNo--;
      }
      checkAndUpdateButtonStatus();
    });
  }

  //updates all the buttons on the page
  //the prev, next, info, about, main etc.
  //depending on which page/pose we are in
  //at the moment.
  void checkAndUpdateButtonStatus() {
    if (_currentPageNo == 0) {
      prevButtonDisabled = true;
    } else {
      prevButtonDisabled = false;
    }
    if (_currentPageNo == (_totalPoses - 1)) {
      nextButtonDisabled = true;
    } else {
      nextButtonDisabled = false;
    }
  }

  //Returns the current page's image
  String getCurrentPageImage() {
    String returnVal = _poses.elementAt(_currentPageNo).image;
    return returnVal;
  }

  //Returns the current page's heading
  String getCurrentPageHeading() {
    String returnVal = _poses.elementAt(_currentPageNo).name;
    return returnVal;
  }

  //Returns the current page's description
  String getCurrentPageDescription() {
    return _poses.elementAt(_currentPageNo).process;
  }

  //Navigates to the Home Screen
  //where we give an introduction to the whole app
  void gotoHomeScreen() {
    setState(() {
      _currentPageNo = 0;
      checkAndUpdateButtonStatus();
    });
  }

  //Returns the current PoseDetails object
  PoseDetails getCurrentPose() {
    return _poses.elementAt(_currentPageNo);
  }

  //Building the UI for the page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sun Salutations - ' + getCurrentPageHeading(),
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    getCurrentPageImage(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    getCurrentPageDescription(),
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    textScaleFactor: 1.2,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  // mini: true,
                  child: Icon(FontAwesomeIcons.home),
                  onPressed: gotoHomeScreen,
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  // mini: true,
                  child: Icon(FontAwesomeIcons.arrowCircleLeft),
                  onPressed: prevButtonDisabled ? null : () => gotoPrevPage(),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  child: Icon(FontAwesomeIcons.arrowCircleRight),
                  onPressed: nextButtonDisabled ? null : () => gotoNextPage(),
                ),
              ),
              Expanded(
                flex: 1,
                //The circular slider is used to enable the user
                //to set the timer between the movements
                child: SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    infoProperties: InfoProperties(
                        mainLabelStyle: TextStyle(
                      color: Colors.white,
                    )),
                    customColors: CustomSliderColors(
                      progressBarColor: Colors.blue,
                      dotColor: Colors.blueAccent,
                      trackColor: Colors.deepPurple,
                      hideShadow: true,
                    ),
                    size: 50.0,
                  ),
                  initialValue: 0.0,
                  max: 15.0,
                  min: 0.0,
                  onChange: (double value) {
                    Future.delayed(
                        Duration.zero,
                        () => setState(() {
                              _delayTime = value.toInt();
                            }));
                  },
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  // mini: true,
                  child: Icon(
                    FontAwesomeIcons.infoCircle,
                  ),
                  onPressed: () {
                    PoseInfoPage infopage =
                        new PoseInfoPage(pose: getCurrentPose());
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => infopage),
                    );
                  },
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  child: Icon(FontAwesomeIcons.book),
                  onPressed: () {
                    AboutPage aboutPage = new AboutPage();
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => aboutPage),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
