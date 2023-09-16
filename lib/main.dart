import 'package:cv/cv_edit.dart';
import 'package:cv/data/cv_data.dart';
import 'package:flutter/material.dart';

void main() {
  final CvDetails cvDetails = CvDetails(
      Fullname: 'Unique chiemerie Agbanajelu',
      Slackusername: 'Not Your average dev',
      Github: 'polymath-ic',
      Personalbio: 'intellectually malnourished ,wannabe SWE');
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: CvScreen(
        cvDetails: cvDetails,
      ),
      // routes: {
      //   '/edit': (context) => Cvedit(
      //         cvDetails: cvDetails,
      //         reloadData: (){s},
      //       ),
      // },
    ),
  );
}

class CvScreen extends StatefulWidget {
  final CvDetails cvDetails;
  const CvScreen({super.key, required this.cvDetails});

  @override
  State<CvScreen> createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          //this is the background for the app
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.shade400,
                    Colors.purple.shade300,
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //code to switch screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cvedit(
                    cvDetails: widget.cvDetails,
                    reloadData: () {
                      setState(() {});
                    },
                  ),
                ),
              );
            },
            child: const Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit_document,
                    size: 40,
                  ),
                  Text('Edit')
                ],
              ),
            ),
          ),
        ),
//this is the cv screen components stacked on the scaffold,
        Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            //this is like a custom app bar
            Center(
              child: Container(
                height: 30,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.purple.shade600),
                margin: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    'CV-app',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w100,
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //this is the container that has the editable text and info
            Container(
              height: 400,
              width: 300,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple.shade600,
              ),
              child: ListView(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'FULL NAME:',
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                    Text(
                      widget.cvDetails.Fullname,
                      style: const TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Slack Username : ',
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                    Text(
                      widget.cvDetails.Slackusername,
                      style: const TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Github handle:',
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                    Text(
                      widget.cvDetails.Github,
                      style: const TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Personal Bio:',
                      style: TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      widget.cvDetails.Personalbio,
                      style: const TextStyle(
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        )
      ],
    );
  }
}
