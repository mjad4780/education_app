import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../key.dart';

final int userID = Random().nextInt(1000);

class VideoCallPage extends StatelessWidget {
  const VideoCallPage(
      {super.key, required this.callId, required this.userName});

  final String callId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      userName: userName, //Entered by the user in the previous screen.
      appID:
          appId, // Retrieved from the call_info.dart file for Zego Cloud configuration.
      appSign:
          appSign, // Retrieved from the call_info.dart file for Zego Cloud configuration.
      callID: callId, // The call ID the user wants to join.
      userID: userID.toString(), // The randomly generated user ID.
      config: ZegoUIKitPrebuiltCallConfig
          .oneOnOneVideoCall(), //Set to oneOneOneVideoCall() for a one-on-one video call.
    );
  }
}
