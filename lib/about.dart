import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//This is the about page, where the credits
//are mentioned.
//It also has a link to the URL from where the
//book that motivated this app was bought
class AboutPage extends StatelessWidget {
  void launchURL() async {
    const url = 'https://prakashan.vrmvk.org/suryanamaskar-as.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About',
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
                          'Source:',
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
                          'Surya Namaskar - An Instruction Booklet',
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
                          'ISBN:',
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
                          '81-89248-16-2',
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
                          'Publisher:',
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
                          'Vivekananda Kendra Prakashan Trust on behalf of'
                          ' Vivekananda Kendra.',
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
                          'Web:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Verdana',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          child: Text(
                            'vkendra.org',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Arial',
                              color: Colors.blueAccent,
                            ),
                          ),
                          onTap: () => launchURL(),
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
        heroTag: "infobtn2",
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
