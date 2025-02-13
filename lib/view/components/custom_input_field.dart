import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  String? labelText;
  IconData? prefixIcon;
  int? maxLines;
  CustomInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.labelText,
      this.maxLines,
      this.prefixIcon});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  FocusNode focusNode = FocusNode();

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
        TextField(
          focusNode: focusNode,
          onTapOutside: (event) {
            focusNode.unfocus();
          },
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: Colors.black)
                : null,
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black, width: 1)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: .5),
            ),
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black87),
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          ),
          maxLines: widget.maxLines,
        ),
      ],
    );
  }
}
