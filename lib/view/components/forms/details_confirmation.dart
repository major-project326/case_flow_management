import 'package:flutter/material.dart';

class DetailsConfirmation extends StatelessWidget {
  const DetailsConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Confirm Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
