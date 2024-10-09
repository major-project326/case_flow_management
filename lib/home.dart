import 'package:flutter/material.dart';
import 'package:major_project/upload.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
           
            children: <Widget>[
              Image.asset(
                'assets/images/logo1.png', 
                width: 450,
                height: 450,
              ),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Upload(title: 'Case Management System',) ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 210, 210, 210),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text('UPLOAD CASE'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle button press for Check Status
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 210, 210, 210),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    
                  ),
                ),
                child: Text('CHECK STATUS'),
              ),
            ],
          ),
        );
  }
}