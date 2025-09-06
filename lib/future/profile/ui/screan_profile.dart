import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/core/extensions/extention_navigator.dart';
import 'package:education/core/get_it/get_it.dart';
import 'package:education/future/main/cubit/main_cubit.dart';
import 'package:education/future/profile/logic/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/language/lang_keys.dart';
import '../widget/card_profile.dart';
import '../widget/get_profile_bloc.dart';

class ScreanProfile extends StatelessWidget {
  const ScreanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUser(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 35,
                    ),
                    onPressed: () {
                      context.read<MainCubit>().changeIndex(0);
                    },
                  ),
                  Text(context.translate(LangKeys.profile),
                      style: context.textStyle.bodyLarge),
                ],
              ),
            ),
            const GetProfileBlocBuilder(),
          ],
        ),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              CardProfile(
                user: user,
              ),
            ],
          ),
        ),
        if (user?.userMetadata?['image'] != null ||
            user?.userMetadata?['avatar_url'] != null)
          Positioned(
              top: 20,
              right: width(context) / 3.4,
              child: Container(
                decoration: const ShapeDecoration(
                  color: Color(0xFFD7D7D7),
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 4,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Color(0xFF167F71),
                    ),
                  ),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: CachedNetworkImageProvider(
                      user?.userMetadata?['image'] ??
                          user?.userMetadata?['avatar_url'] ??
                          ""),
                ),
              )),
        // const Positioned(bottom: 10, child: AnimatedLogoutButton()),
      ],
    );
  }
}

/// زر تسجيل الخروج أنيق مع حركة:
/// - تأثير تكبير/تصغير عند الضغط (AnimatedScale)
/// - تدوير أيقونة صغيرة أثناء التأكيد
/// - خلفية تدرج لوني، ظل ناعم، وripple عند اللمس
class AnimatedLogoutButton extends StatefulWidget {
  final VoidCallback? onLogout;
  final String label;
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  const AnimatedLogoutButton({
    super.key,
    this.onLogout,
    this.label = 'Logout',
    this.height = 56,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
  });

  @override
  State<AnimatedLogoutButton> createState() => _AnimatedLogoutButtonState();
}

class _AnimatedLogoutButtonState extends State<AnimatedLogoutButton>
    with SingleTickerProviderStateMixin {
  bool _pressed = false;
  late final AnimationController _iconController;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  void _handleTap() async {
    // لمسة: نبضة سريعة + تدوير الأيقونة ثم تنفيذ onLogout
    setState(() => _pressed = true);
    _iconController.forward(from: 0);

    // تأثير مرئي قصير قبل تنفيذ الحدث الخارجي
    await Future.delayed(const Duration(milliseconds: 220));
    widget.onLogout?.call();

    setState(() => _pressed = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // تدرج لوني أنيق
    final gradient = LinearGradient(
      begin: const Alignment(-1, -0.2),
      end: const Alignment(1, 0.6),
      colors: [
        theme.colorScheme.primary, // افتراضي: لون التطبيق
        theme.colorScheme.secondary.withOpacity(0.95),
      ],
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: _pressed ? 0.98 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Material(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          elevation: 6,
          shadowColor: Colors.black.withOpacity(0.18),
          child: Ink(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  offset: const Offset(0, 6),
                  blurRadius: 18,
                )
              ],
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              onTap: _handleTap,
              splashFactory: InkRipple.splashFactory,
              child: Container(
                height: widget.height,
                padding: widget.padding,
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // أيقونة مع تدوير حلزوني أثناء النقر
                    AnimatedBuilder(
                      animation: _iconController,
                      builder: (context, child) {
                        final angle = _iconController.value * 1.0; // radians
                        return Transform.rotate(
                          angle: angle,
                          child: child,
                        );
                      },
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.12),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // نص قابل للتبديل—يمكنك تمرير label باللغة العربية مثلاً "تسجيل خروج"
                    Text(
                      widget.label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // لمسة نهائية: مؤثر صغير يظهر عند hover على الويب
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
