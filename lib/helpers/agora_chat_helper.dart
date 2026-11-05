// import 'package:agora_chat_sdk/agora_chat_sdk.dart';
// import 'package:yestuu/constants/constants.dart';
// import 'package:yestuu/utils/print_logs.dart';

// class AgoraChatHelper {

//   void initSDK() async {
//     ChatOptions options = ChatOptions(
//       appKey: AppConstants.AGORA_APP_ID,
//       autoLogin: false,
//     );
//     await ChatClient.getInstance.init(options);
//     await ChatClient.getInstance.startCallback();
//   }

//   void signOut() async {
//     try {
//       await ChatClient.getInstance.logout(true);
//       print("sign out succeed");
//     } on ChatError catch (e) {
//       PrintLogs().print_console_error(message: "sign out failed, code: ${e.code}, desc: ${e.description}",e: e.toString());
//     }
//   }
// }