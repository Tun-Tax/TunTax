import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuntax/widgets/background.dart';
import 'package:tuntax/widgets/custom_text_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss keyboard on tap outside
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Color(0xFF4983F6), Color(0xFFC175F5)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: Text(
              'Masuk',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.52,
                height: 1.3,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.2),
                    blurRadius: 3.0,
                    color: Colors.black.withAlpha(77),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: Background(
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Masuk ke akun atau buat akun baru untuk menggunakan aplikasi',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 115, 114, 116),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          // Google Button
                          OutlinedButton(
                            onPressed: () {
                              debugPrint('Sign in with Google');
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              side: const BorderSide(color: Color(0xFFE0E0E0)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              minimumSize: const Size(double.infinity, 0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/google-logo.png',
                                  height: 24.0,
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                  'Masuk dengan Google',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          // Facebook Button
                          OutlinedButton(
                            onPressed: () {
                              debugPrint('Sign in with Facebook');
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              side: const BorderSide(color: Color(0xFFE0E0E0)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              minimumSize: const Size(double.infinity, 0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/facebook-logo.png',
                                  height: 24.0,
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                  'Masuk dengan Facebook',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(color: Color(0xFFE0E0E0)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  'Atau',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: const Color.fromARGB(
                                      255,
                                      115,
                                      114,
                                      116,
                                    ),
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Divider(color: Color(0xFFE0E0E0)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24.0),
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
                          const SizedBox(height: 8.0),
                          CustomTextField(
                            name: 'password',
                            labelText: 'Kata Sandi',
                            controller: _passwordController,
                            isPassword: true,
                            obscureText: _obscureText,
                            onVisibilityToggle: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Kata sandi tidak boleh kosong',
                              ),
                              FormBuilderValidators.minLength(
                                6,
                                errorText: 'Kata sandi minimal 6 karakter',
                              ),
                            ]),
                          ),
      
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _rememberMe = value ?? false;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Ingat saya',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                        255,
                                        115,
                                        114,
                                        116,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  debugPrint('Forgot Password');
                                },
                                child: Text(
                                  'Lupa kata sandi?',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: const Color(0xFF4285F4),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.saveAndValidate() ??
                                  false) {
                                debugPrint(
                                  'Email: ${_formKey.currentState?.fields['email']?.value}',
                                );
                                debugPrint(
                                  'Password: ${_formKey.currentState?.fields['password']?.value}',
                                );
                                debugPrint('Remember Me: $_rememberMe');
                                debugPrint('Login button pressed');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                0xFF4285F4,
                              ), // A shade of blue
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              minimumSize: const Size(double.infinity, 0),
                            ),
                            child: Text(
                              'Masuk',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
      
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Belum memiliki akun?',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: const Color.fromARGB(255, 115, 114, 116),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.go('/signup');
                                },
                                child: Text(
                                  'Daftar',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: const Color(0xFF4285F4),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
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
