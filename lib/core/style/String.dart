abstract class TextStyless {
  static const String gg = 'Online Learning';
    static const String gg = 'We Provide Classes Online Classes and Pre Recorded Leactures.!';

    static const String gg = 'Learn from Anytime';
    static const String gg = 'Booked or Same the Lectures for Future';
    static const String gg = 'Get Online Certificate';
    static const String gg = 'Analyse your scores and Track your results';
    static const String gg = 'Let’s you in';
    static const String gg = 'Continue with Google';
    static const String gg = 'Sign In with Your Account';
    static const String gg = 'Continue with Apple';
    static const String gg = '( Or )';
    static const String gg = 'Don’t have an Account? ';
    static const String gg = 'SIGN UP';
    static const String gg = 'Getting Started.!';
    static const String gg = 'Create an Account to Continue your allCourses';
    static const String gg = 'Agree to Terms & Conditions';
    static const String gg = 'Or Continue With';
    static const String gg = 'Sign Up';
    static const String gg = 'Already have an Account? SIGN IN';
    static const String gg = 'Let’s Sign In.!';
    static const String gg = 'Login to Your Account to Continue your Courses';
        static const String gg = 'Remember Me';
    static const String gg = 'Forgot Password?';
    static const String gg = 'Fill Your Profile';
    static const String gg = '';
    static const String gg = '';
    static const String gg = '';
    static const String gg = '';
    static const String gg = '';
    static const String gg = '';
    static const String gg = '';
    static const String gg = '';



}
import 'package:flutter/material.dart';

class Process extends StatelessWidget {
  const Process({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 460,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 360,
                  height: 460,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF4F8FE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 102,
                top: 62.46,
                child: SizedBox(
                  width: 153.01,
                  height: 153.01,
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 152.62,
                          height: 152.62,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 22.03,
                                top: 81.81,
                                child: SizedBox(
                                  width: 107.84,
                                  height: 70.81,
                                  child: Stack(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 153.01,
                          height: 153.01,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://via.placeholder.com/153x153"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 263,
                top: 108,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF472D2D),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 92,
                top: 168,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF167F71),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 92,
                top: 78,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFFF6B00),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              const Positioned(
                left: 95,
                top: 245,
                child: Text(
                  'Congratulations',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF202244),
                    fontSize: 24,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 40,
                top: 292,
                child: SizedBox(
                  width: 280,
                  height: 75,
                  child: Text(
                    'Your Account is Ready to Use. You will be redirected to the Home Page in a Few Seconds.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF545454),
                      fontSize: 14,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 160,
                top: 371,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/40x40"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}