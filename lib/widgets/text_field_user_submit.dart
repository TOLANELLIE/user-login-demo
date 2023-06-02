import 'package:flutter/material.dart';

class UserTextFieldSubmit extends StatelessWidget {
  const UserTextFieldSubmit({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.deepPurple,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
