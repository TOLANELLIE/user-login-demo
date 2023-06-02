import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// ignore: must_be_immutable
class InputTextField extends StatefulWidget {
  const InputTextField({
    super.key,
    required this.label,
    required this.hinttext,
    required this.controller,
    this.obscuretext = false,
  });

  final String label;
  final String hinttext;
  final TextEditingController controller;

  //bool
  final bool obscuretext;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  late bool _hidepassword;

  @override
  void initState() {
    super.initState();
    _hidepassword = widget.obscuretext;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: TextField(
        obscureText: _hidepassword,
        controller: widget.controller,
        decoration: InputDecoration(
          //color
          filled: true,
          fillColor: Colors.indigo.withOpacity(0.2),

          //suffix icon
          suffixIcon: widget.obscuretext
              ? IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    setState(() {});

                    _hidepassword = !_hidepassword;
                  },
                  icon: Icon(
                    _hidepassword
                        ? PhosphorIcons.fill.eyeSlash
                        : PhosphorIcons.fill.eye,
                  ),
                )
              : null,

          label: Text(widget.label),
          hintText: widget.hinttext,

          //erroe border
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),

          //enable border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.deepPurple,
              width: 1,
            ),
          ),

          //disable border
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.deepPurple,
              width: 2,
            ),
          ),

          //focus border
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.deepPurple,
              width: 2,
            ),
          ),

          //focus error border
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.deepPurple,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
