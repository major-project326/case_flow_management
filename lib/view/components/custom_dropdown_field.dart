import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomDropdownField extends StatefulWidget {
  final String value;
  final Widget selectionScreen;
  String? labelText;
  final Function(String) onChange;
  CustomDropdownField(
      {super.key,
      required this.value,
      required this.selectionScreen,
      this.labelText,
      required this.onChange});

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText!,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        if (widget.labelText != null)
          SizedBox(
            height: 5,
          ),
        GestureDetector(
          onTap: () async {
            String value = await Get.to(widget.selectionScreen);
            widget.onChange(value);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: .5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.value,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
                Transform.rotate(
                    angle: pi / 2, child: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ),
        )
      ],
    );
  }
}
