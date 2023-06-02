import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.titile,
    this.ontap,
  });

  final String titile;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 50),
          backgroundColor: Colors.indigo,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: ontap,
        child: Text(
          titile,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
