import 'dart:io';

import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = new TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> messages = [
    ChatMessage(texto: ' Esto es un texto de prueba', uid: '123'),
    ChatMessage(texto: ' Esto es un texto de prueba', uid: '4324'),
    ChatMessage(texto: ' Esto es un texto de prueba', uid: '133'),
    ChatMessage(
        texto:
            ' Esto es un tfdfaffdfafdsfasfaf dfafavaf afasfkf dksfnsafasfexto de prueba',
        uid: '123'),
  ];
  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text(
                'TE',
                style: TextStyle(fontSize: 12),
              ),
              maxRadius: 15,
              backgroundColor: Colors.blue[100],
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Diana Camila',
              style: TextStyle(color: Colors.black87, fontSize: 10),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return messages[index];
                },
                itemCount: messages.length,
                reverse: true,
                physics: BouncingScrollPhysics(),
              ),
            ),
            Divider(
              height: 1,
            ),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmit,
              onChanged: (value) {
                //TODO: cuando hay un valor, para poder posteaer
                if (value.length == 0) {
                  _estaEscribiendo = false;
                } else {
                  _estaEscribiendo = true;
                }
                setState(() {});
              },
              decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje'),
              focusNode: _focusNode,
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: (!Platform.isIOS)
                  ? CupertinoButton(child: Text('Enviar'), onPressed: () {})
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: IconTheme(
                        data: IconThemeData(color: Colors.blue[400]),
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          icon: Icon(Icons.send),
                          onPressed: !_estaEscribiendo
                              ? null
                              : () =>
                                  _handleSubmit(_textController.text.trim()),
                        ),
                      ),
                    ))
        ],
      ),
    ));
  }

  _handleSubmit(String text) {
    _focusNode.requestFocus();
    _textController.clear();

    setState(() {
      // messages = List<ChatMessage>.from(messages.reversed);
      messages.insert(0,
          ChatMessage(texto: text, uid: text.length.isEven ? '123' : '143'));
      _estaEscribiendo = false;
    });
  }
}
