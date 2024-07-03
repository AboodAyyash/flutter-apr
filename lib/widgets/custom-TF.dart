
  import 'package:flutter/material.dart';

Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? errorText,
    required ValueChanged<String> onChanged,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        errorText: errorText,
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
