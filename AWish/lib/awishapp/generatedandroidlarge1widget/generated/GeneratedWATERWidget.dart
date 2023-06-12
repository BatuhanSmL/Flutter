import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/* Text WATER
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedWATERWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        var data = {
          "to": "/topics/12345",
          "notification": {
            "title": "Emre has an ORDER",
            "body": "WATER",
            "image":
                "https://w7.pngwing.com/pngs/145/113/png-transparent-a-cup-of-water-mineral-water-pure-water-cups.png"
          }
        };

        await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                'key= AAAACEouGE8:APA91bFPdRGsFY5kAXHlB6ptA6BZV6ULuOMS-DXrRCvwCkuKiKtNLFuvgIEFiXRulTuf1FAtaHQGCg-6friizqAGusU_TX9TlOpxRGYuQ7mq7RrMVu8PUGZ1fSVUm-MwWH9zPC1tHDRp',
          },
          body: jsonEncode(data),
        );
      },
      child: Text(
        '''WATER''',
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.2102272033691406,
          fontSize: 30.0,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 255, 255, 255),

          /* letterSpacing: 0.0, */
        ),
      ),
    );
  }
}
