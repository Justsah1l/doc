import 'package:flutter/cupertino.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class callzego extends StatelessWidget {
  final String callID;
  callzego({Key? key, required this.callID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:
          1080141203, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign:
          "064e7a5a7ab67e239072ca087a37c849a08c92de81b08c99c92463d60e808a24", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: 'user_id',
      userName: 'user_name',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
    ;
  }
}
