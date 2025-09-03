import 'package:flutter/material.dart';

class FailerWidget extends StatelessWidget {
  const FailerWidget({
    super.key,
    required this.messege,
    required this.onPressed,
    this.untext = true,
    this.icon = Icons.error_outline,
  });
  final IconData icon;
  final bool untext;
  final String messege;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.blueAccent,
            size: 90,
          ),
          const SizedBox(height: 16),
          Text(
            messege,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 27),
          untext
              ? ElevatedButton.icon(
                  onPressed: onPressed,
                  icon: const Icon(
                    color: Colors.white,
                    Icons.refresh,
                    size: 28,
                  ),
                  label: const Text('Try Again'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
