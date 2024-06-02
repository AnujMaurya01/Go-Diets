import 'dart:developer';

import 'package:dietitian/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'msg_bottom_box_expand/msg_normal_bottom_box_expand.dart';
import 'msg_bottom_model.dart';

class MsgNormalBottomBox extends StatefulWidget {
  MsgNormalBottomBox(
      {required this.sendTextFieldonSubmitted,
      required this.onCameraIconButtonOnPressed,
      required this.onImageIconButtonOnPressed,
      required this.onVideoIconButtonOnPressed});

  Function? nonselfOnTapResponse;
  double boxBottomPadding = 50;
  bool emojiShowing = false;
  bool bottomExpandShowing = false;
  void Function(String) sendTextFieldonSubmitted;

  void Function(String?) onCameraIconButtonOnPressed;
  void Function(String?) onImageIconButtonOnPressed;
  void Function(String?) onVideoIconButtonOnPressed;
  @override
  State<StatefulWidget> createState() => _WidgetState();
}

class _WidgetState extends State<MsgNormalBottomBox> {
  String sendTextMessageValue = '';
  final TextEditingController _controller = TextEditingController();

  _onEmojiSelected(dynamic emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  void initState() {
    MsgBottomModel.nonselfOnTapResponse = () {
      widget.boxBottomPadding = 0;
      widget.emojiShowing = false;
      FocusScope.of(context).unfocus();
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('ontap bottom box');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // shadow color
                            spreadRadius: 0.2, // spread radius
                            blurRadius: 0.3, // blur radius
                            offset:
                                Offset(0, 0.3), // changes position of shadow
                          ), // shadow color
                        ],
                        //t the background color
                      ),
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp('[.,!\'\"]')),
                        ],
                        controller: _controller,
                        onTap: () {
                          setState(() {
                            widget.boxBottomPadding = 10;
                            widget.emojiShowing = false;
                            widget.bottomExpandShowing = false;
                          });
                        },
                        onSubmitted: (value) {
                          widget.sendTextFieldonSubmitted(value);
                          FocusScope.of(context).unfocus();
                          _controller.text = '';
                          setState(() {
                            widget.boxBottomPadding = 50;
                          });
                          log(value);
                        },
                        textInputAction: TextInputAction.newline,
                        maxLines: null, // S
                        cursorColor: ColorResources
                            .buttonYellow, // et maxLines to null to allow multiline input
                        decoration: InputDecoration(
                          hintText: 'Message',
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 10),
                          suffixIcon: Theme(
                            data: ThemeData(
                              // Set the color of the icon to your desired color
                              iconTheme: IconThemeData(
                                color: Colors.grey,
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  FocusScope.of(context).unfocus();
                                  widget.emojiShowing = false;
                                  widget.bottomExpandShowing =
                                      !widget.bottomExpandShowing;
                                  if (widget.bottomExpandShowing) {
                                    widget.boxBottomPadding = 10;
                                  } else {
                                    widget.boxBottomPadding = 50;
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.attach_file,
                                size: 20,
                              ),
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ))),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.boxBottomPadding = 10;
                    widget.emojiShowing = false;
                    widget.bottomExpandShowing = false;
                    widget.sendTextFieldonSubmitted(_controller.text);
                    FocusScope.of(context).unfocus();
                    _controller.text = '';
                    setState(() {
                      widget.boxBottomPadding = 50;
                    });
                    log(_controller.text);
                  });
                },
                // onSubmitted: (value) {
                //   widget.sendTextFieldonSubmitted(value);
                //   FocusScope.of(context).unfocus();
                //   _controller.text = '';
                //   setState(() {
                //     widget.boxBottomPadding = 50;
                //   });
                //   log(value);
                // },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorResources.buttonYellow,
                  ),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          Offstage(
            offstage: !widget.bottomExpandShowing,
            child: MsgNormalBottomBoxExpand(
              onCameraIconButtonOnPressed: (path) {
                widget.onCameraIconButtonOnPressed(path);
              },
              onImageIconButtonOnPressed: (path) {
                widget.onImageIconButtonOnPressed(path);
              },
              onVideoIconButtonOnPressed: (path) {
                widget.onVideoIconButtonOnPressed(path);
              },
            ),
          ),
        ],
      ),
    );
  }
}
