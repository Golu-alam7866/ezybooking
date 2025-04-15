import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FetchNotificationScreen extends StatelessWidget {
  final RemoteMessage message;
  const FetchNotificationScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Fetch Notification Screen"),),
        body: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.notifications_active),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.notification!.title.toString(),
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(message.notification!.body.toString()),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8,left: 25),
                    child: Text(
                      message.data.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )


      // ListTile(
      //   leading: Icon(CupertinoIcons.bell_circle),
      //   title: Text(message.notification!.title.toString()),
      //   subtitle: Text(message.notification!.body.toString()),
      //   trailing: Text(message.data.toString()),
      // ),
    );
  }
}