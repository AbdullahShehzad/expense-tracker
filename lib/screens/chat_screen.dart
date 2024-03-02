import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';

  final String userId;
  final String name;
  final String image;
  final bool isOnline;
  final int lastOnline;

  const ChatScreen({
    required this.userId,
    this.name = 'Jhon Abraham',
    this.image = 'assets/home/user_profile.png',
    this.isOnline = true,
    this.lastOnline = 0,
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  void sendMessage() {
    if (_messageController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('messages').add({
        'text': _messageController.text,
        'userId': widget.userId,
        'timestamp': DateTime.now().toUtc().toIso8601String(),
      });

      setState(() {
        _messageController.clear();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();

    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
          centerTitle: false,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  widget.image,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                  ),
                  Text(
                    widget.isOnline
                        ? 'Active Now'
                        : '${widget.lastOnline} min ago',
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('messages')
              .orderBy('timestamp', descending: false)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 24,
              ),
              itemBuilder: (context, index) {
                var message = snapshot.data?.docs[index];
                bool isMe = message!['userId'] == widget.userId;

                // Check if the next message is from the same user
                bool isNextSameUser = index + 1 < snapshot.data!.docs.length &&
                    snapshot.data!.docs[index + 1]['userId'] ==
                        message['userId'];

                // Check if the previous message was from a different user or if it's the first message
                bool isFirstOtherUserMessage = index == 0 ||
                    snapshot.data!.docs[index - 1]['userId'] !=
                        message['userId'];

                if (isMe) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              color: Color(0xFFE9AB17).withOpacity(.57),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              snapshot.data?.docs[index]['text'],
                            ),
                          ),
                          SizedBox(height: !isNextSameUser ? 8 : 10),
                          if (!isNextSameUser)
                            Text(
                              DateFormat('hh:mm a').format(
                                DateTime.parse(snapshot.data?.docs[index]
                                            ['timestamp'] ??
                                        DateTime.now().toIso8601String())
                                    .toLocal(),
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (isFirstOtherUserMessage)
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            widget.image,
                          ),
                        ),
                      if (isFirstOtherUserMessage)
                        const SizedBox(
                          width: 12,
                        ),
                      if (!isFirstOtherUserMessage)
                        const SizedBox(
                          width: 52,
                        ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isFirstOtherUserMessage)
                            Text(
                              widget.name,
                            ),
                          if (isFirstOtherUserMessage)
                            const SizedBox(height: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFF2F7FB),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                margin:
                                    const EdgeInsets.only(left: 10, right: 2),
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  snapshot.data?.docs[index]['text'],
                                ),
                              ),
                              SizedBox(height: !isNextSameUser ? 8 : 10),
                              if (!isNextSameUser)
                                Text(
                                  DateFormat('hh:mm a').format(
                                    DateTime.parse(snapshot.data?.docs[index]
                                                ['timestamp'] ??
                                            DateTime.now().toIso8601String())
                                        .toLocal(),
                                  ),
                                ),
                              if (!isNextSameUser) const SizedBox(height: 30),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  height: 1,
                  thickness: 0,
                  color: Color(0xFFEEFAF8),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 20,
                    bottom: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _messageController,
                          autofocus: true,
                          autocorrect: false,
                          // style: AppTextStyles.circularStdMedium.copyWith(
                          //   color: ColorName.background,
                          //   fontSize: 12,
                          // ),
                          onChanged: (value) {
                            setState(() {
                              _messageController;
                            });
                          },
                          onFieldSubmitted: (value) => sendMessage(),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            isDense: true,
                            filled: true,
                            fillColor: const Color(0xFFF3F6F6),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 12,
                            ),
                            hintText: 'Write your message',
                          ),
                        ),
                      ),
                      if (_messageController.text.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: IconButton(
                            onPressed: sendMessage,
                            style: IconButton.styleFrom(
                              backgroundColor: Color(0xFFE9AB17),
                            ),
                            icon: SvgPicture.asset(
                              'assets/send.svg',
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
