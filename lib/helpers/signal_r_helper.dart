// import 'package:signalr_core/signalr_core.dart';

// class SignalRService {
//   HubConnection? _hubConnection;

//   Future<void> connect() async {
//     _hubConnection = HubConnectionBuilder()
//         .withUrl('http://apnaapi.sigmaitcorporate.com/Chathub')
//         .build();

//     // Register handler for receiving messages
//     _hubConnection!.on('ReceiveMessage', (message) {
//       print('Message received: $message');
//     });

//     await _hubConnection!.start();
//     print('Connection started');
//   }

//   Future<void> sendMessage(String user, String message) async {
//     await _hubConnection!.invoke('SendMessage', args: [user, message]);
//   }

//   Future<void> disconnect() async {
//     await _hubConnection!.stop();
//   }
// }