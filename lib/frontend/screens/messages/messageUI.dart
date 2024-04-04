// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:dienstleisto/constants/widgets/textfeild.dart';
import 'package:flutter/material.dart';

class ChatUI extends StatefulWidget {
  const ChatUI({super.key});

  @override
  _ChatUIState createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<Message> messages = [
      Message(sender: 'sender', text: 'Hello!'),
      Message(sender: 'receiver', text: 'Hi!'),
      Message(sender: 'sender', text: 'How are you?'),
      Message(sender: 'receiver', text: 'I am fine!'),
      Message(sender: 'sender', text: 'I have to tell you some thing'),
      Message(sender: 'receiver', text: 'sure, what up ?'),
      Message(sender: 'sender', text: 'I need your help in an assignment'),
      Message(sender: 'receiver', text: 'sure, I can help you, give me a call'),
      // Add more messages as needed
    ];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1556157382-97eda2d62296?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ), // replace with your profile image URL
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "John Dee",
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: "ABeeZee",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ), // replace with the name
                MyText(
                  text: "Active",
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontFamily: "ABeeZee",
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call,
                color: Theme.of(context).colorScheme.primary),
            onPressed: () {
              // handle your video call action here
            },
          ),
          IconButton(
            icon:
                Icon(Icons.call, color: Theme.of(context).colorScheme.primary),
            onPressed: () {
              // handle your call action here
            },
          ),
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {
            final message = messages[index];
            final bool isSentBySender = message.sender == 'sender';
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: isSentBySender
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSentBySender
                          ? Theme.of(context).colorScheme.secondary
                          : const Color.fromRGBO(239, 239, 244, 2),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15),
                        bottomLeft: isSentBySender
                            ? const Radius.circular(15)
                            : const Radius.circular(0),
                        bottomRight: isSentBySender
                            ? const Radius.circular(0)
                            : const Radius.circular(15),
                      ),
                    ),
                    child: MyText(
                      text: message.text,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: "ABeeZee",
                      color: isSentBySender
                          ? Theme.of(context).colorScheme.background
                          : Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: 15.0,
          top: 8.0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: IconButton(
                icon: Icon(Icons.add,
                    color: Theme.of(context).colorScheme.background),
                onPressed: () {
                  // handle your add action here
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: CustomTextField(
                hintText: 'Type a message',
                controller: _messageController,
                hintColor: Colors.grey,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: IconButton(
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).colorScheme.background,
                ),
                onPressed: () {
                  // handle your send action here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}
