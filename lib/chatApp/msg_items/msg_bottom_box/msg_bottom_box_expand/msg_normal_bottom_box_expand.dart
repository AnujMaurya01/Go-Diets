import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';

import '../../../../utils/style.dart';
import '../../../uuid_center.dart';
import 'msg_bottom_box_expand_cell.dart';

class MsgNormalBottomBoxExpand extends StatefulWidget {
  MsgNormalBottomBoxExpand(
      {required this.onCameraIconButtonOnPressed,
        required this.onImageIconButtonOnPressed,
        required this.onVideoIconButtonOnPressed});
  void Function(String? photo) onCameraIconButtonOnPressed;
  void Function(String? path) onImageIconButtonOnPressed;
  void Function(String? path) onVideoIconButtonOnPressed;
  // void Function()? onImageIconButtonOnPressed;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  XFile? video;

  @override
  State<StatefulWidget> createState() => MsgNormalBottomBoxExpandState();
}

class MsgNormalBottomBoxExpandState extends State<MsgNormalBottomBoxExpand> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // shadow color
                spreadRadius: 0.2, // spread radius
                blurRadius: 0.3, // blur radius
                offset: Offset(0, 0.3), // changes position of shadow
              ), // shadow color
            ],
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final XFile? cameraPhoto = await widget._picker
                            .pickImage(
                            source: ImageSource.camera, imageQuality: 30);

                        final String path =
                            (await getApplicationDocumentsDirectory()).path;
                        File cameraPhotoFile = File(cameraPhoto!.path);
                        final File newImage = await cameraPhotoFile
                            .copy('$path/${cameraPhoto.name}');
                        widget.onCameraIconButtonOnPressed(newImage.path);
                      },
                      icon: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                        ),
                      ),
                    ),
                    Text(
                      "Camera",
                      style: poppinsSemiBold.copyWith(
                        fontSize: 10,
                        height: 1,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final XFile? albumPhoto = await widget._picker
                            .pickImage(source: ImageSource.gallery);
                        final String path =
                            (await getApplicationDocumentsDirectory()).path;

                        File albumPhotoFile = File(albumPhoto!.path);
                        final File newImage = await albumPhotoFile
                            .copy('$path/${albumPhoto.name}');

                        widget.onImageIconButtonOnPressed(newImage.path);
                      },
                      icon: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Icon(
                          Icons.photo_size_select_actual_outlined,
                          size: 20,
                        ),
                      ),
                    ),
                    Text(
                      "Images",
                      style: poppinsSemiBold.copyWith(
                        fontSize: 10,
                        height: 1,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final XFile? albumVideo = await widget._picker
                            .pickVideo(source: ImageSource.gallery);
                        log(albumVideo!.path);
                        final String path =
                            (await getApplicationDocumentsDirectory()).path;

                        File albumVideoFile = File(albumVideo.path);
                        final File newVideo = await albumVideoFile
                            .copy('$path/${UUIDCenter.uuid}.mp4');
                        widget.onVideoIconButtonOnPressed(newVideo.path);
                      },
                      icon: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Icon(
                          Icons.videocam_outlined,
                          size: 20,
                        ),
                      ),
                    ),
                    Text(
                      "Video",
                      style: poppinsSemiBold.copyWith(
                        fontSize: 10,
                        height: 1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ) /*GridView(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, childAspectRatio: 1.0,crossAxisSpacing:8),
            children: <Widget>[

              // MsgBottomBoxExpandCell(
              //   targetIconButton: IconButton(
              //     onPressed: () async {
              //       FilePickerResult? result =
              //           await FilePicker.platform.pickFiles();
              //
              //       // String? path = await FilesystemPicker.open(
              //       //     context: context, rootDirectory: Directory('rootPath'));
              //     },
              //     icon: Icon(
              //       Icons.folder_outlined,
              //       size: 30,
              //     ),
              //   ),
              // ),
            ],
          ),*/
      ),
    );
  }
}
