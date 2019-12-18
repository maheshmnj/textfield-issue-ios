import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Key key;

  TextFieldWidget({this.controller, this.hint, this.key});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: TextField(
          key: widget.key,
          controller: widget.controller,
          // style: inputStyle,
          obscureText: widget.hint.contains("password") ? isHidden : false,
          decoration: InputDecoration(
              fillColor: Colors.red,
              contentPadding: EdgeInsets.only(
                left: 16,
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              suffixIcon: widget.hint.contains("password")
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isHidden = isHidden ? false : true;
                        });
                      },
                      icon: Icon(
                        isHidden
                            ? Icons.remove_red_eye
                            : Icons.panorama_fish_eye,
                        color: Colors.black54,
                      ),
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.red)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Colors.green)))),
    );
  }
}
