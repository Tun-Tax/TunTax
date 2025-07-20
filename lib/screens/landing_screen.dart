import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuntax/screens/signup_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 72, left: 24, right: 24),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Selamat datang di',
                style: GoogleFonts.poppins(
                  color: Color(0xFF635A92),
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.64,
                  height: 1.5,
                ),
              ),
            ),
            Row(
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
                    'Tun',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 56,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'Tax',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF635A92),
                    fontSize: 56,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Image.asset('assets/images/landing-logo.png'),
            SizedBox(height: 40),
            Text(
              'Aplikasi keuangan dan pajak UMKM',
              style: GoogleFonts.poppins(
                color: Color(0xFF635A92),
                fontSize: 32,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.64,
                height: 1.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Ringankan urusan keuangan dan pajak, optimalkan peluang bisnismu!',
              style: GoogleFonts.poppins(
                color: Color(0xFF635A92),
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4983F6), Color(0xFFC175F5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: Theme.of(context).useMaterial3
                    ? [
                        BoxShadow(
                          color: Colors.black.withAlpha(48),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupScreen()),
                  );
                },
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 115, vertical: 14),
                  ),
                  minimumSize: WidgetStateProperty.all(Size(352, 69)),
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  elevation: WidgetStateProperty.all(0),
                ),
                child: Text(
                  'Mulai',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
