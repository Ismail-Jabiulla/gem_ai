import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gem_ai/constants/color_constant.dart';
import 'package:gem_ai/constants/image_constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/text_constants.dart';

class ChatPageScreen extends StatefulWidget {
  @override
  _ChatPageScreenState createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessageDecoration> _messages = [];
  ScrollController _scrollController = ScrollController();

  void _addMessage(String text, String messageType) {
    setState(() {
      _messages.add(ChatMessageDecoration(text: text, messageType: messageType));
      if (messageType == 'user') {
        _messages.add(
            ChatMessageDecoration(
          text: 'API response goes here',
          messageType: 'api',
        ));
      }
    });
    _scrollToBottom();
  }

  // void _updateApiMessage(String newText) {
  //   setState(() {
  //     _messages.add(ChatMessageDecoration(text: newText, messageType: 'api'));
  //   });
  //
  //   _scrollToBottom();
  // }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAppBackground,
      appBar: AppBar(
        title: Text('Chating Title', style: GoogleFonts.chivoMono(fontSize: 18), maxLines: 1, overflow: TextOverflow.ellipsis,),
        centerTitle: true,
        backgroundColor: colorAppBackground,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.push_pin))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(imageAppLogo, color: Colors.green.shade200,),
                    SizedBox(height: 50),
                    Text(TextChatScreenTxt, style: GoogleFonts.chivoMono(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.green.shade200), textAlign: TextAlign.center,),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            )
                : ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: colorAppTextWhite
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 1.5)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      filled: true,
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send_rounded, color: Colors.grey, size: 30,),
                  onPressed: () {
                    String userMessage = _messageController.text;
                    if (userMessage.isNotEmpty) {
                      _addMessage(userMessage, 'user');
                      Future.delayed(Duration(milliseconds: 300), () {
                        _scrollToBottom();
                      });
                      _messageController.clear();
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessageDecoration extends StatelessWidget {
  final String text;
  final String messageType;

  const ChatMessageDecoration({required this.text, required this.messageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      alignment: messageType == 'user'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: messageType == 'user' ? Colors.green.shade400 : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}