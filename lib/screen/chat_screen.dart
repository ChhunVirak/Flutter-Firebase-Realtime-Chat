// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  final String? name;
  final String? age;
  const Chat({Key? key, this.name, this.age}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat UI'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green[100],
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, __) {
                  return __.isEven
                      ? getChatBlock(TYPE.reciever)
                      : __ == 21
                          ? const Align(
                              alignment: Alignment.centerRight,
                              child: FlutterLogo(
                                size: 100,
                              ),
                            )
                          : getChatBlock(TYPE.sender);
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(height: 10);
                },
                itemCount: 50,
              ),
            ),
            Container(
              color: Colors.yellow[900],
              child: SafeArea(
                top: false,
                minimum: const EdgeInsets.only(
                    bottom: 20, top: 20, left: 10, right: 10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.attach_file),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getChatBlock(TYPE type) {
    return Builder(builder: (context) {
      if (type == TYPE.reciever) {
        return Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.red[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
                'Reciever lorem isum sad fs ge r sdf sdgfsdf sfsd sdfsdf sdf '),
          ),
        );
      } else {
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
                'Sender lorem isum sad fs ge r sdf sdgfsdf sfsd sdfsdf sdf '),
          ),
        );
      }
    });
  }

  Map<String, String> toMap() {
    return <String, String>{
      'name': name!,
      'age': age!,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      name: map['name'] != null ? map['name'] as String : null,
      age: map['age'] != null ? map['age'] as String : null,
    );
  }
}

enum TYPE {
  sender,
  reciever,
}
