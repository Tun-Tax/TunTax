import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDateTimePicker extends StatelessWidget {
  final String name;
  final String labelText;
  final String? Function(DateTime?)? validator;

  const CustomDateTimePicker({
    super.key,
    required this.name,
    required this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 115, 114, 116),
          ),
        ),
        const SizedBox(height: 8.0),
        FormBuilderDateTimePicker(
          name: name,
          inputType: InputType.date,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            suffixIcon: const Icon(Icons.calendar_month_outlined),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
