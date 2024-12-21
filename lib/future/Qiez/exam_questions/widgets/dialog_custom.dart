import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String subTitle;
  final Color leftColor;
  final String buttonText;

  const CustomDialog(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.subTitle,
      required this.leftColor,
      required this.buttonText,
      required this.onConfirm,
      required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: PopScope(
        canPop: false,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          child: Container(
            width: 327,
            height: 265.2,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(imageUrl, height: 100, width: 100),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Text(
                  subTitle,
                  style: const TextStyle(
                      color: Color(0xff737373),
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: onConfirm,
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 108,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: leftColor,
                          ),
                          child: Text(
                            buttonText,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextButton(
                        onPressed: onCancel,
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 108,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffF3F4F6)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
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
    );
  }
}
