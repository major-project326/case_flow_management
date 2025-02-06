import 'package:flutter/material.dart';

class CaseUploadPage extends StatefulWidget {
  const CaseUploadPage({super.key});

  
  @override
  _CaseUploadPageState createState() => _CaseUploadPageState();
}

class _CaseUploadPageState extends State<CaseUploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
        title: Text("Case Management system",
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TextField(
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  labelText: 'NAME',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'CASE ID',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                  style: TextStyle(color: Colors.white),
                  items: const [
                    DropdownMenuItem(
                      value: 'Family',
                      child: Text(
                        'Family',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DropdownMenuItem(
                        value: 'Criminal',
                        child: Text('Criminal',
                            style: TextStyle(color: Colors.black))),
                    DropdownMenuItem(
                      value: "Civil",
                      child:
                          Text('Civil', style: TextStyle(color: Colors.black)),
                    ),
                    DropdownMenuItem(
                      value: 'Tax',
                      child: Text('Tax', style: TextStyle(color: Colors.black)),
                    ),
                    DropdownMenuItem(
                      value: 'Property',
                      child: Text(
                        'Property',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: 'TYPE OF CASE',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onChanged: (val) {
                    print(val);
                  }),
              const SizedBox(height: 20),
              const TextField(
                minLines: 3,
                maxLines: 3,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'DETAILS OF THE CASE',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle submit button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 210, 210, 210),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
    );
  }
}