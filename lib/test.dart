// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'AI Chat',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ChatPageScreen(),
//     );
//   }
// }
//
// class ChatPageScreen extends StatefulWidget {
//   @override
//   _ChatPageScreenState createState() => _ChatPageScreenState();
// }
//
// class _ChatPageScreenState extends State<ChatPageScreen> {
//   TextEditingController _messageController = TextEditingController();
//   List<ChatMessageDecoration> _messages = [];
//   ScrollController _scrollController = ScrollController();
//
//   void _addMessage(String text, String messageType) {
//     setState(() {
//       _messages.add(ChatMessageDecoration(text: text, messageType: messageType));
//       if (messageType == 'user') {
//         _messages.add(ChatMessageDecoration(
//           text: 'API response goes here',
//           messageType: 'api',
//         ));
//       }
//     });
//     _scrollToBottom();
//   }
//
//   // void _updateApiMessage(String newText) {
//   //   setState(() {
//   //     _messages.add(ChatMessageDecoration(text: newText, messageType: 'api'));
//   //   });
//   //
//   //   _scrollToBottom();
//   // }
//
//   void _scrollToBottom() {
//     _scrollController.animateTo(
//       _scrollController.position.maxScrollExtent,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AI Chat'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: _messages.isEmpty
//                 ? Center(
//               child: Text(
//                 'Start a conversation!',
//                 style: TextStyle(
//                     fontSize: 18.0, fontWeight: FontWeight.bold),
//               ),
//             )
//                 : ListView.builder(
//               controller: _scrollController,
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 return _messages[index];
//               },
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//                 border: Border.all()
//             ),
//             padding: EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Type a message...',
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     String userMessage = _messageController.text;
//                     if (userMessage.isNotEmpty) {
//                       _addMessage(userMessage, 'user');
//                       Future.delayed(Duration(milliseconds: 300), () {
//                         _scrollToBottom();
//                       });
//                       _messageController.clear();
//                     }
//                     setState(() {});
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ChatMessageDecoration extends StatelessWidget {
//   final String text;
//   final String messageType;
//
//   const ChatMessageDecoration({required this.text, required this.messageType});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(8.0),
//       alignment: messageType == 'user'
//           ? Alignment.centerRight
//           : Alignment.centerLeft,
//       child: Container(
//         padding: EdgeInsets.all(12.0),
//         decoration: BoxDecoration(
//           color: messageType == 'user' ? Colors.blue : Colors.green,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
