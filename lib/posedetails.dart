class Illustration {
  final double offsetX;
  final double offsetY;
  final String image;
  final double zoom;
  final String source;

  const Illustration(this.image, this.offsetX, this.offsetY, this.zoom, this.source);
}

class PoseDetails {
  late String process;
  late String breathing;
  late String precaution;
  late String benefits;
  late String name;
  late String image;
  late List<Illustration> illustrations;
}

class Pose {
  final String name;
  final String? benefits;
  final String? breathing;
  final String? precautions;
  final String process;
  final String image;

  const Pose({
    required this.name,
    required this.image,
    required this.process,
    this.benefits,
    this.breathing,
    this.precautions
  });

  bool hasBenefits() => benefits != null;
  bool hasBreathing() => breathing != null;
  bool hasPrecautions() => precautions != null;
}

class PoseProvider {
  List<Pose> getPoses() {
    return const [
      Pose(
        name: 'Sthiti',
        image: 'images/starting.jpg',
        process: '''
Stand erect without bending any part of the body.
Let the toes, heels, knees, and thigh be joined. Body should be erect
without stiffening and relaxed. Join both the palms in Namaskar Mudra.
Place them on the chest, with thumbs touching the middle of the chest
spread out.
''',
        breathing: 'Normal: full inhalation and slow exhalation',
      ),
      Pose(
          name: 'Ekam',
          image: 'images/pose1.jpg',
          process: '''
Raise both the hands duly stretched, palms continued to be
joined together all along. As hands are on both sides of your head, allow
the upper arms to touch your ears and bend back in the waist.
''',
          benefits: '''
Ensures a) Elasticity of Lungs, b) Flexibility of Spine,
c) Toning of muscles of abdomen, chest, forearms and upper arms.
''',
          breathing: 'Inhale',
          precautions: '''
Do not bend your knees and elbows. Keep the upper arms'
'and ears aligned throughout.'
'''
      )
    ];
  }
}

class PoseList {
  late List<PoseDetails> poses;

  PoseList() {
    initializePoses();
  }

  void initializePoses() {
    poses = List<PoseDetails>.empty(growable: true);
    poses.add(_createPoseIntro());
    poses.add(_createPoseStart());
    poses.add(_createPose1());
    poses.add(_createPose2());
    poses.add(_createPose3());
    poses.add(_createPose4());
    poses.add(_createPose5());
    poses.add(_createPose6());
    poses.add(_createPose7());
    poses.add(_createPose8());
    poses.add(_createPose9());
    poses.add(_createPose10());
    poses.add(_createPose11());
    poses.add(_createPose12());
  }

  PoseDetails _createPoseIntro() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Introduction';
    newPose.image = 'images/symbol.png';
    newPose.process =
        """Surya Namaskar is a yoga based exercise for over all Personality Development - Body, Mind and Intellect - a gift of Indian heritage to mankind. This being a non-sectarian practice, it is universal in application irrespective of caste, creed, religion, gender, and nationality. Vivekanand a Kendra endeavours to bring this exercise within the reach of people in all walk of life.""";
    newPose.benefits =
        '''It can be performed by any able-bodied person from 8 years to 80 years. It is especially beneficial for students. It enables them to achieve a) balanced physical growth, b) healthy and efficient body, c) balanced state of mind, d) enhanced work efficiency through concentration, alertness, memory development and emotional control.''';
    newPose.breathing = '-';
    newPose.precaution =
        '''Surya Namaskar should be performed in empty stomach. It is preferable to do this exercise in open, fresh air. However well ventilated rooms can also be used. People suffering from hernia, spinal disorders, high blood pressure should consult the doctor as well as competent Yoga instructor.''';

    return newPose;
  }

  PoseDetails _createPoseStart() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Start';
    newPose.image = 'images/starting.jpg';
    newPose.process = 'Stand erect without bending any part of the body. '
        'Let the toes, heels, knees, and thigh be joined. Body should be erect '
        'without stiffening and relaxed. Join both the palms in Namaskar Mudra. '
        'Place them on the chest, with thumbs touching the middle of the chest '
        'spread out.';
    newPose.benefits = '-';
    newPose.breathing = 'Normal: full inhalation and slow exhalation';
    newPose.precaution = '-';
    newPose.illustrations = [
      Illustration('images/pranamasana1.jpg', -1280.0, -260.0, 0.42, 'keralatourism.org'),
      Illustration('images/pranamasana1.jpg', -520.0, 0.0, 0.21, 'keralatourism.org')
    ];
    return newPose;
  }

  PoseDetails _createPose1() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Ekam';
    newPose.image = 'images/pose1.jpg';
    newPose.process =
    'Raise both the hands duly stretched, palms continued to be'
        'joined together all along. As hands are on both sides of your head, allow'
        ' the upper arms to touch your ears and bend back in the waist.';
    newPose.benefits =
    'Ensures a) Elasticity of Lungs, b) Flexibility of Spine,'
        'c) Toning of muscles of abdomen, chest, forearms and upper arms.';
    newPose.breathing = 'Inhale';
    newPose.precaution =
    'Do not bend your knees and elbows. Keep the upper arms'
        'and ears aligned throughout.';
    newPose.illustrations = [
      Illustration('images/ekam1.jpeg', -280.0, -40.0, 1.4, 'https://newrajayoga.com/'),
      Illustration('images/pose1.jpg', -50.0, -50.0, 0.55, 'Rama'),
    ];
    return newPose;
  }

  PoseDetails _createPose2() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Dve';
    newPose.image = 'images/pose2.jpg';
    newPose.process = 'Come up by straightening the spine. Then bend forward'
        ' directing top of the head towards ground and allow the palms to '
        'touch the ground. Make an attempt to place palms by the side of the '
        'feet and allow the forehead to come close to the knee-caps.';
    newPose.benefits = 'Increases suppleness of spine, improves functioning of '
        'abdominal glands and digestive functions. Increases blood supply to '
        'facial muscles, eyes and brain.';
    newPose.breathing = 'Exhale';
    newPose.precaution =
        'Ensure that your upper arms and the ears are aligned. '
        'Do not bend your knees. Go to the extend your body permits.';
    newPose.illustrations = [
      Illustration('images/dve2.jpeg', -120.0, -30.0, 1.4, 'https://newrajayoga.com/'),
      Illustration('images/pose2.jpg', -40.0, -25.0, 0.55, 'keralatourism.org'),
    ];
    return newPose;
  }

  PoseDetails _createPose3() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Trini';
    newPose.image = 'images/pose3.jpg';
    newPose.process = 'Place the palms on the side of and in the line of feet. '
        'Fold your left knee allowing it to come closer to the left shoulder. '
        'Left thigh touching the left side of the chest. Stretch back the right'
        ' leg and rest the toes of right feet and right knee on the ground. '
        'Lower the spine and arch up the chest and look up, fixing the gaze at'
        ' a point approx. at 45 degree angle to the ground.';
    newPose.benefits = '-';
    newPose.breathing = 'Inhale';
    newPose.precaution = '-';
    newPose.illustrations = [
      Illustration('images/pose3.jpg', -80.0, -25.0, 0.8, 'Rama'),
    ];
    return newPose;
  }

  PoseDetails _createPose4() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Catvari';
    newPose.image = 'images/pose4.jpg';
    newPose.process = 'Release the left leg. Balance the body on the palms and '
        'toes. Whole body is in slanted straight position without bending anywhere. '
        'Fix the gaze on the ground on a point 2 feet forward from the palms.';
    newPose.benefits =
        'Strengthens palms, wrists and elbows. Muscles of forearms '
        'and upper arms are strengthened. Toes and floor muscles of the feet become'
        ' elastic and flexible.';
    newPose.breathing = 'Exhale';
    newPose.precaution = 'Do not bend or arch up the neck and spine. Position '
        'the shoulders above the palms without bending the elbows.';
    newPose.illustrations = [
      Illustration('images/pose4.jpg', -1100.0, -200.0, 0.82, 'Rama'),
    ];
    return newPose;
  }

  PoseDetails _createPose5() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Panca';
    newPose.image = 'images/pose5.jpg';
    newPose.process = 'Rest the knees on the ground, pull in the stomach and '
        'abdomen and sit back resting the buttocks on the heels. Then relax the '
        'shoulders, neck and head. Make an attempt to rest the forehead on the '
        'ground.';
    newPose.benefits = 'Tones up functioning of lungs, abdominal glands, and '
        'digestive system. Ensures adequate supply of blood to head, facial '
        'muscles and eyes.';
    newPose.breathing =
        'Inhale while resting the knees, exhale while pulling in '
        'the stomach and sitting back on heels.';
    newPose.precaution =
        'Do not disturb the seat in order to reach forehead on '
        'the ground.';
    newPose.illustrations = [
      Illustration('images/pose5.jpg', -60.0, -100.0, 0.8, 'Rama'),
    ];
    return newPose;
  }

  PoseDetails _createPose6() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Sata';
    newPose.image = 'images/pose6.jpg';
    newPose.process = 'Raise the body from the fifth position and stretch '
        'forward without disturbing palms and toes. Rest the forehead, nose, '
        'chest and knees on the ground. Do not rest abdomen on the ground and raise'
        'the hips little upward.';
    newPose.benefits = 'Ajna Cakra is activated as forehead is rested on the '
        'ground leading to self control. It also leads to stability of mind.';
    newPose.breathing = 'Exhale fully and hold the breath.';
    newPose.precaution = ' ';
    newPose.illustrations = [
      Illustration('images/pose6.jpg', -950.0, -50.0, 0.8, 'Rama'),
    ];
    return newPose;
  }

  PoseDetails _createPose7() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Sapta';
    newPose.image = 'images/pose7.jpg';
    newPose.process = 'Raise your head towards the ceiling/sky by arching '
        'the spine and raising the whole body from the ground. The body should '
        'be rested on palms and toes only.';
    newPose.benefits = 'Builds up self-confidence and alertness. Increases '
        'suppleness of spine. Enhances elasticity of lungs. Palms, wrists, and'
        ' toes are strengthened.';
    newPose.breathing = 'Inhale';
    newPose.precaution = 'Do not rest the knees on the ground. Straighten '
        'the toes on the floor.';
    newPose.illustrations = [
      Illustration('images/pose7.jpg', -900.0, -80.0, 0.8, 'Rama'),
    ];
    return newPose;
  }

  PoseDetails _createPose8() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Asta';
    newPose.image = 'images/pose8.jpg';
    newPose.process = 'Keeping the position of palms and feet in tact, raise '
        'the waist. Direct top of the head towards ground and push the chin '
        'closer to the throat. Ensure that the body is shaped like an inverted V.';
    newPose.benefits = 'Improves thyroid glands, tones calf muscles and thigh '
        'muscles and enhances the flexibility of floor muscles.';
    newPose.breathing = 'Exhale';
    newPose.precaution = 'Do not bend your elbows and knees.';
    newPose.illustrations = [
      Illustration('images/pose8.jpg', -980.0, -330.0, 1, 'Rama'),
    ];
    return newPose;
  }

  PoseDetails _createPose9() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Nava';
    newPose.image = 'images/pose9.jpg';
    newPose.process =
        'Rest the knees on the ground, pull in the abdomen and sit '
        'back resting the buttocks on the heels. Then relax the shoulders, neck '
        'and head. Make an attempt to rest the forehead on the ground.';
    newPose.benefits =
        'Tones up the functioning of lungs, abdominal glands, and'
        'digestive system. Ensures adequate supply of blood to head, facial muscles'
        ' and eyes. Helps to relax the mind.';
    newPose.breathing = 'Inhale while resting the knees, exhale while pulling '
        'in stomach and sitting back on heels.';
    newPose.precaution =
        'Do not disturb the seat in order to make the forehead '
        'touch the ground.';
    newPose.illustrations = [
      Illustration('images/pose9.jpg', -60.0, -80.0, 0.8, 'Rama'),
    ];
    return newPose;
  }

  PoseDetails _createPose10() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Dasa';
    newPose.image = 'images/pose10.jpg';
    newPose.process = 'Come up by placing the right foot in between the two '
        'palms. Allow the right shoulder and the right knee to come together. '
        'Let the left leg be kept stretched resting left knee and toes on the '
        'ground. Lower the spine and arch up the chest and thoracic region and '
        'look up, fixing the gaze at a point approx. 45 degree to the ground.';
    newPose.benefits = 'Tones the sympathetic nervous system'
        's functions. '
        'Improves eyesight as you gaze up and the thyroid glads as you stretch up. '
        'Tones the calf muscles and thigh muscles.';
    newPose.breathing = 'Inhale';
    newPose.precaution = 'Palms and the right foot should be in the same line. '
        'Do not look down or bend your neck.';
    newPose.illustrations = [
      Illustration('images/pose10.jpg', -700.0, -25.0, 0.7, 'Rama'),
    ];
    return newPose;
  }

  PoseDetails _createPose11() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Ekadasa';
    newPose.image = 'images/pose11.jpg';
    newPose.process = 'Come up by bringing forward the left foot placing it '
        'by the side of right foot in between two palms.';
    newPose.benefits =
        'Increases suppleness of spine as it gets stretched, improves '
        'functioning of abdominal glands and digestive functions. Helps to improve '
        'memory, concentration and nervous system.';
    newPose.breathing = 'Exhale';
    newPose.precaution =
        'Ensure that your arms and the ears are aligned. Do not'
        ' bend your knees.';
    newPose.illustrations = [
      Illustration('images/pose11.jpg', -80.0, -25.0, 0.45, 'Rama'),
    ];
    return newPose;
  }

  PoseDetails _createPose12() {
    PoseDetails newPose = new PoseDetails();
    newPose.name = 'Dvadasa';
    newPose.image = 'images/pose12.jpg';
    newPose.process =
        'Come up slowly straightening the spine, raising the chest, '
        'shoulder, head and neck back to normal position with palms joined '
        'in Namaskara Mudra.';
    newPose.benefits = 'Helps to keep mind steady and develop awareness.';
    newPose.breathing = 'Inhale';
    newPose.precaution = 'Do not stiffen the body, be relaxed.';
    newPose.illustrations = [
      Illustration('images/pose12.jpg', -50.0, -25.0, 0.6, 'Rama'),
    ];
    return newPose;
  }
}
