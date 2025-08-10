import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tuntax/services/auth_service.dart';
import 'package:tuntax/widgets/background.dart';
import 'package:tuntax/widgets/custom_date_time_picker.dart';
import 'package:tuntax/widgets/custom_text_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isPasswordVisible = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final authService = ref.read(authServiceProvider);
      final values = _formKey.currentState!.value;

      try {
        await authService.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
          _fullNameController.text,
          _phoneController.text,
          values['birth_date'] as DateTime,
        );
        // On successful signup, the authStateProvider will update and redirect
        // No explicit navigation needed here as it's handled by the router's redirect logic
      } on FirebaseAuthException catch (e) {
        String message;
        if (e.code == 'weak-password') {
          message = 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          message = 'The account already exists for that email.';
        } else {
          message = e.message ?? 'An unknown error occurred.';
        }
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An unexpected error occurred: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard on tap outside
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        body: Background(
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  color: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: FormBuilder(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                colors: [Color(0xFF4983F6), Color(0xFFC175F5)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.srcIn,
                            child: Text(
                              'Daftar Akun',
                              style: GoogleFonts.poppins(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.52,
                                height: 1.3,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(1.0, 1.2),
                                    blurRadius: 3.0,
                                    color: Colors.black.withAlpha(77),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sudah punya akun?',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF635A92),
                                  fontSize: 14,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.go('/login');
                                },
                                child: Text(
                                  'Masuk',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFF4983F6),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            name: 'full_name',
                            labelText: 'Nama Lengkap',
                            controller: _fullNameController,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Nama lengkap tidak boleh kosong',
                              ),
                              FormBuilderValidators.minLength(
                                3,
                                errorText: 'Nama lengkap minimal 3 karakter',
                              ),
                            ]),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            name: 'email',
                            labelText: 'Email',
                            controller: _emailController,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Email tidak boleh kosong',
                              ),
                              FormBuilderValidators.email(
                                errorText: 'Masukkan email yang valid',
                              ),
                            ]),
                          ),
                          const SizedBox(height: 20),
                          CustomDateTimePicker(
                            name: 'birth_date',
                            labelText: 'Tanggal lahir',
                            validator: FormBuilderValidators.required(
                              errorText: 'Tanggal lahir wajib diisi',
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            name: 'phone',
                            labelText: 'Nomor telepon',
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nomor telepon wajib diisi';
                              }
                              if (!value.startsWith('+62')) {
                                return 'Nomor telepon harus diawali +62';
                              }
                              if (value.length < 10) {
                                return 'Nomor telepon minimal 10 karakter';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            name: 'password',
                            labelText: 'Buat Kata Sandi',
                            controller: _passwordController,
                            isPassword: true,
                            obscureText: !_isPasswordVisible,
                            onVisibilityToggle: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Kata sandi wajib diisi',
                              ),
                              FormBuilderValidators.minLength(
                                6,
                                errorText: 'Minimal 6 karakter',
                              ),
                            ]),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1D61E7),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(48),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: _signUp,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Daftar',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
