import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utility/images_aseets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool isAnimate = false;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    animate();
  }

  void animate() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isAnimate = true;
      });
    }).then((_) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          controller.forward().then((_) async {
            await afterAnimationNavigate();
          });
        });
      });
    });
  }

  Future<void> afterAnimationNavigate() async {
    bool isLoggedIn = true;
    if (isLoggedIn) {
      debugPrint('LOGGED IN');
      // context.pushAndRemoveUtilsNamed(Routes.mainScreen);
    }
    //   else {
    //     debugPrint('NOT LOGGED IN');
    //     // context.pushReplacementNamed(Routes.signinScreen);
    //   }
  }

  // Future<bool> checkIfUserLoggedIn() async {
  //   String? userId =  await SharedPreferencesHelper.getData('userID');
  //   return userId != null && userId.isNotEmpty;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEEBF7), //AppColors.lightPinkColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 800),
              alignment: isAnimate ? Alignment.center : Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 100.w),
                child: SvgPicture.asset(
                  Assets.imagesLOGO,
                ),
              ),
            ),
            Positioned(
              right: MediaQuery.sizeOf(context).height / 3.5,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      widthFactor: animation.value,
                      child: SvgPicture.asset(
                        Assets.imagesApple,
                        width: 100.w,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
