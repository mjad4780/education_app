import 'package:flutter/material.dart';

class FailerWidget extends StatelessWidget {
  const FailerWidget({
    super.key,
    required this.messege,
    required this.onPressed,
    this.icon = Icons.error_outline,
  });
  final IconData icon;
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
            color: Colors.red,
            size: 90,
          ),
          const SizedBox(height: 16),
          Text(
            messege,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 27),
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(
              color: Colors.white,
              Icons.refresh,
              size: 28,
            ),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
