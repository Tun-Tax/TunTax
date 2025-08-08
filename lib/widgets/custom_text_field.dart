import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onVisibilityToggle;

  const CustomTextField({
    super.key,
    required this.name,
    required this.labelText,
    required this.controller,
    this.validator,
    this.isPassword = false,
    this.obscureText = false,
    this.onVisibilityToggle,
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
        FormBuilderTextField(
          name: name,
          controller: controller,
          obscureText: obscureText,
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
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: onVisibilityToggle,
                  )
                : null,
          ),
          validator: validator,
        ),
      ],
    );
  }
}
