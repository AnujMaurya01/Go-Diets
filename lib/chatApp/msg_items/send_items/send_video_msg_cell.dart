import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import 'package:zego_zim/zego_zim.dart';

import '../../../utils/style.dart';
import '../bubble/image_bubble.dart';
import '../bubble/video_bubble.dart';
import '../uploading_progress_model.dart';

class SendVideoMsgCell extends StatefulWidget {
  ZIMVideoMessage message;
  double? progress;

  SendVideoMsgCell(
      {required this.message, required this.uploadingprogressModel});

  UploadingprogressModel? uploadingprogressModel;
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
  State<StatefulWidget> createState() => _SendVideoMsgCellState();
}

class _SendVideoMsgCellState extends State<SendVideoMsgCell> {
  @override
  void initState() {
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
    }
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (widget.message.fileLocalPath != null) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 10),
                      child: Offstage(
                        offstage: !widget.isUpLoading,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation(Colors.blue),
                          value: widget.progress,
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 10),
                      child: Offstage(
                          offstage: !widget.isUpLoadFailed,
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.red,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${lastTime}",
                            style: poppinsRegular.copyWith(
                                fontSize: 10, color: Colors.black)),
                        VideoBubble(
                            filelocalPath: widget.message.fileLocalPath),
                      ],
                    )
                  ],
                )
              ]
            ],
          ),
        ],
      ),
    );
  }
}
