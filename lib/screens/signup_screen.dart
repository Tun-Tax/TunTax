import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE0F2F7), Color(0xFFD1C4E9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  colors: [Color(0xFF4983F6), Color(0xFFC175F5)],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ).createShader(bounds);
                              },
                              child: Text(
                                'Daftar Akun',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
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
                                    // TODO: Navigate to login screen
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Nama Lengkap',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF635A92),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE4E5E7).withOpacity(0.24),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Patrick Star',
                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFE4E5E7), width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                      ),
                    ),
                  ),
                      const SizedBox(height: 20),
                      Text(
                        'Email',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF635A92),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE4E5E7).withOpacity(0.24),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'patrickst4r@gmail.com',
                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFE4E5E7), width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                      ),
                    ),
                  ),
                      const SizedBox(height: 20),
                      Text(
                        'Tanggal lahir',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF635A92),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE4E5E7).withOpacity(0.24),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '18/03/2024',
                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_month_outlined),
                          onPressed: () {
                            // TODO: Implement date picker
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFE4E5E7), width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                      ),
                    ),
                  ),
                      const SizedBox(height: 20),
                      Text(
                        'Nomor telepon',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF635A92),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE4E5E7).withOpacity(0.24),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '0834400xxxxx',
                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFE4E5E7), width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                      ),
                    ),
                  ),
                      const SizedBox(height: 20),
                      Text(
                        'Buat Kata Sandi',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF635A92),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE4E5E7).withOpacity(0.24),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: TextField(
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        hintText: '********',
                        hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFE4E5E7), width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 14),
                      ),
                    ),
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
                          onPressed: () {
                            // TODO: Implement signup logic
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 14),
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
                      const SizedBox(height: 40), // Bottom padding
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
