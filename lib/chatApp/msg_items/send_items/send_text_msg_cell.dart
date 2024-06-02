import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:zego_zim/zego_zim.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/style.dart';
import '../bubble/text_bubble.dart';

final AuthController _authController = Get.find<AuthController>();

class SendTextMsgCell extends StatefulWidget {
  ZIMTextMessage message;

  SendTextMsgCell({required this.message});
  @override
  State<StatefulWidget> createState() => _MyCellState();
}

class _MyCellState extends State<SendTextMsgCell> {
  get isSending {
    if (widget.message.sentStatus == ZIMMessageSentStatus.sending) {
      return true;
    } else {
      return false;
    }
  }

  get isSentFailed {
    if (widget.message.sentStatus == ZIMMessageSentStatus.failed) {
      return true;
    } else {
      return false;
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    if (dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      final format = DateFormat.jm();
      return format.format(dateTime);
    } else if (dateTime.year == now.year) {
      final format = DateFormat('MMM d');
      return format.format(dateTime);
    } else {
      final format = DateFormat('MMM d, y');
      return format.format(dateTime);
    }
  }

  String? lastTime;
  @override
  Widget build(BuildContext context) {
    if (widget.message.timestamp != null) {
      DateTime lastSeenTime =
          DateTime.fromMillisecondsSinceEpoch(widget.message.timestamp);
      DateTime dateTime = lastSeenTime;
       lastTime = DateFormat.jm().format(dateTime);
      // print("SDSDMSDLMLMSLDML $time");
    }
    String name = widget.message.message;
    int nam = name.length;
    print("SJKDNKNSDNNSK$nam");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("${lastTime}",
              style: poppinsRegular.copyWith(
                  fontSize: 10,  color: Colors.black)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (nam > 30) ...[
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                // bottomRight: Radius.circular(5),
                                topRight: Radius.circular(5.0),
                                topLeft: Radius.circular(5.0)),
                            color: ColorResources.buttonYellow,),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.message.message,
                          style: poppinsRegular.copyWith(
                              fontSize: 14, height: 1.4, color: Colors.black),
                        )),
                  ),
                ),
              ] else ...[

                Padding(
                  padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                  child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              // bottomRight: Radius.circular(5),
                              topRight: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0)),
                          color:  ColorResources.buttonYellow,),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            widget.message.message,
                            style: poppinsRegular.copyWith(
                                fontSize: 14, height: 1.4, color: Colors.black),
                          ),

                        ],
                      )),
                ),
              ],

              /* Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.green, borderRadius: BorderRadius.circular(45)),
              )*/
            ],
          ),
        ],
      ),
    );
    // ); /Container(
    //     padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
    //     width: double.infinity,
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Expanded(
    //           child: Container(),
    //         ),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Text(widget.message.senderUserID),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             Row(
    //               children: [
    //                 Offstage(
    //                   offstage: !isSending,
    //                   child: Container(
    //                     width: 20,
    //                     height: 20,
    //                     margin: const EdgeInsets.only(right: 10),
    //                     child: const CircularProgressIndicator(
    //                       strokeWidth: 2.0,
    //                       color: Colors.grey,
    //                     ),
    //                   ),
    //                 ),
    //                 Offstage(
    //                   offstage: !isSentFailed,
    //                   child: Container(
    //                       width: 20,
    //                       height: 20,
    //                       margin: const EdgeInsets.only(right: 10),
    //                       child: Icon(
    //                         Icons.error_outline,
    //                         color: Colors.red,
    //                       )),
    //                 ),
    //                 TextBubble(widget.message.message, Colors.green.shade300,
    //                     Colors.black, 5, 5)
    //               ],
    //             )
    //           ],
    //         ),
    //         Icon(
    //           Icons.person,
    //           size: 50,
    //         ),
    //       ],
    //     ));
  }

}
