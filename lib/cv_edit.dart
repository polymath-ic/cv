import 'package:flutter/material.dart';
import 'package:cv/data/cv_data.dart';

class Cvedit extends StatefulWidget {
  final CvDetails cvDetails;
  const Cvedit({super.key, required this.cvDetails});

  @override
  State<Cvedit> createState() => _CveditState();
}

class _CveditState extends State<Cvedit> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _Fullnamesctrl = TextEditingController();
  TextEditingController _githubctrl = TextEditingController();
  TextEditingController _slackctrl = TextEditingController();
  TextEditingController _personalbioctrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    _Fullnamesctrl.text = widget.cvDetails.Fullname;
    _githubctrl.text = widget.cvDetails.Github;
    _personalbioctrl.text = widget.cvDetails.Personalbio;
    _slackctrl.text = widget.cvDetails.Slackusername;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: _formkey,
            child: ListView(
              children: [
                //the fullname form
                TextFormField(
                  controller: _Fullnamesctrl,
                  decoration: const InputDecoration(
                    labelText: 'Full name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your full-name';
                    }
                    return null;
                  },
                ),
                //the slack name form
                TextFormField(
                  controller: _slackctrl,
                  decoration: const InputDecoration(
                    labelText: 'Slack username',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Slack username';
                    }
                    return null;
                  },
                ),
                //the github account form
                TextFormField(
                  controller: _githubctrl,
                  decoration: const InputDecoration(
                    labelText: 'Git-hub username',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your Git-hub username';
                    }
                    return null;
                  },
                ),
                //the personal bio form
                TextFormField(
                  controller: _personalbioctrl,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Bio',
                  ),
                  maxLines: null,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        widget.cvDetails.Fullname = _Fullnamesctrl.text;
                        widget.cvDetails.Slackusername = _slackctrl.text;
                        widget.cvDetails.Github = _githubctrl.text;
                        widget.cvDetails.Personalbio = _personalbioctrl.text;
                        Navigator.pop(context);
                      });
                    }
                  },
                  child: const Icon(Icons.check),
                )
              ],
            )),
      ),
    );
  }
}
