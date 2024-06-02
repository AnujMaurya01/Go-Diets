import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_zim/zego_zim.dart';

import '../../../utils/colors.dart';
import '../bubble/text_bubble.dart';

class ReceiveTextMsgCell extends StatefulWidget {
  ZIMTextMessage message;
  String? conversationName;
  ReceiveTextMsgCell({required this.message, this.conversationName});

  @override
  State<StatefulWidget> createState() => _MyCellState();
}

class _MyCellState extends State<ReceiveTextMsgCell> {
  String? userName;
  String firstCharacters = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserName();
  }

  Future<String> _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName') ?? '';
  }

  String? lastTime;
  String? weekend;
  _loadUserName() async {
    String name = await _getUserName();
    setState(() {
      userName = name;
      print("SDKSJDNNSDNNSN$userName");
    });

    if (userName != "") {
      String fullName = userName!;
      List<String> names = fullName.split(" ");
      for (String name in names) {
        setState(() {
          firstCharacters += name[0];
        });
        print("SDNJDKNKSNDn$firstCharacters");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.message.timestamp != null) {
      DateTime lastSeenTime =
          DateTime.fromMillisecondsSinceEpoch(widget.message.timestamp);
      DateTime dateTime = lastSeenTime;
      lastTime = DateFormat.jm().format(dateTime);
      weekend = DateFormat.EEEE().format(dateTime);
      print("ZDJKNSDNNSDNNSDNSNDKNSD $weekend");
    }
    String name = widget.message.message;
    int nam = name.length;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (firstCharacters != "") ...[
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorResources.buYellow,
              ),
              child: Text(
                "${firstCharacters}",
                style:
                    poppinstMedium.copyWith(fontSize: 15, color: Colors.white),
              ),
            ),
          ] else ...[
            Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorResources.buttonYellow,
              ),
              child: Icon(
                Icons.person,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
          if (nam > 30) ...[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 5, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${lastTime}",
                        style: poppinsRegular.copyWith(
                            fontSize: 10, color: Colors.black)),
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // shadow color
                                spreadRadius: 0.2, // spread radius
                                blurRadius: 0.3, // blur radius
                                offset: Offset(
                                    0, 0.3), // changes position of shadow
                              ), // shadow color
                            ],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                                topRight: Radius.circular(5.0),
                                topLeft: Radius.circular(0.0)),
                            color: Colors.white),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.message.message,
                          style: poppinsRegular.copyWith(
                              fontSize: 14, height: 1.3, color: Colors.black),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${lastTime}",
                      style: poppinsRegular.copyWith(
                          fontSize: 10, color: Colors.black)),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topRight: Radius.circular(5.0),
                              topLeft: Radius.circular(0.0)),
                          color: Colors.white),
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Text(
                            widget.message.message,
                            style: poppinsRegular.copyWith(
                                fontSize: 14, height: 1.3, color: Colors.black),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
