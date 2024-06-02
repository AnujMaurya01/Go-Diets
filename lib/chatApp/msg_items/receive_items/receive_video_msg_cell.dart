import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zego_zim/zego_zim.dart';

import '../../../utils/style.dart';
import '../bubble/image_bubble.dart';
import '../bubble/video_bubble.dart';
import '../downloading_progress_model.dart';

class ReceiveVideoMsgCell extends StatefulWidget {
  ZIMVideoMessage message;
  double? progress;
  DownloadingProgressModel? downloadingProgressModel;
  ZIMMediaDownloadingProgress? downloadingProgress;

  ReceiveVideoMsgCell(
      {required this.message, required this.downloadingProgressModel});

  get isUpLoading {
    if (message.sentStatus == ZIMMessageSentStatus.sending) {
      return true;
    } else {
      return false;
    }
  }

  get isUpLoadFailed {
    if (message.sentStatus == ZIMMessageSentStatus.failed) {
      return true;
    } else {
      return false;
    }
  }

  @override
  State<StatefulWidget> createState() => ReceiveVideoeMsgCellState();
}

class ReceiveVideoeMsgCellState extends State<ReceiveVideoMsgCell> {
  checkIsdownload() async {
    if (widget.message.fileLocalPath == '') {
      ZIMMediaDownloadedResult result = await ZIM
          .getInstance()!
          .downloadMediaFile(widget.message, ZIMMediaFileType.originalFile,
              (message, currentFileSize, totalFileSize) {});
      setState(() {
        widget.message = result.message as ZIMVideoMessage;
      });
    }
  }

  getVideoBubble() {
    return VideoBubble(filelocalPath: widget.message.fileLocalPath);
  }

  @override
  void initState() {
    // TODO: implement initState
    checkIsdownload();
    super.initState();
  }

  String? lastTime;
  String? weekend;
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
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("${lastTime}",
                          style: poppinsRegular.copyWith(
                              fontSize: 10, color: Colors.black)),
                      getVideoBubble()
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
