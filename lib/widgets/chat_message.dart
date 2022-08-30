import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;

  const ChatMessage({Key? key, required this.texto, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (uid == '123') ? _myMessage() : _notMyMessage(),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color(0xff4D9EF6),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 8, left: 50, right: 8),
        child: Text(
          texto,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color(0xffE4E5E8),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 8, right: 50, left: 8),
        child: Text(
          texto,
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
