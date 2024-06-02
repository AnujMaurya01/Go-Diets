import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dietitian/controller/auth_controller.dart';
import 'package:dietitian/route/route.dart';
import 'package:dietitian/utils/colors.dart';
import 'package:dietitian/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

final AuthController _authController = Get.find<AuthController>();

class LpginInstramScreen extends StatefulWidget {
  const LpginInstramScreen({super.key});

  @override
  State<LpginInstramScreen> createState() => _LpginInstramScreenState();
}

class _LpginInstramScreenState extends State<LpginInstramScreen> {
  WebViewController? _webViewController;
  late VideoPlayerController _controller;
  final String initialUrl = 'https://www.instagram.com/go__diet/';
  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
    'https://cdn.pixabay.com9/27/15/52/man-2792456_1280.jpg',
    'https://cdn/photo/2017/0.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/09/27/15/52/man-2792456_1280.jpg',
  ];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    for (var controller in _authController.videoControllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  void _playVideo(int index) {
    for (var i = 0; i < _authController.videoControllers.length; i++) {
      if (i != index && _authController.videoControllers[i] != null) {
        _authController.videoControllers[i]!.pause(); // Pause other videos
      }
    }
    if (_authController.videoControllers[index] != null) {
      _authController.videoControllers[index]!.initialize().then((_) {
        _authController.videoControllers[index]!.play();
      });
    }
  }

  void _playVide(int index) {
    for (var i = 0; i < _authController.videoController.length; i++) {
      if (i != index && _authController.videoController[i] != null) {
        _authController.videoController[i]!.pause(); // Pause other videos
      }
    }
    if (_authController.videoController[index] != null) {
      _authController.videoController[index]!.initialize().then((_) {
        _authController.videoController[index]!.play();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              alignment: Alignment.topCenter,
              height: Get.height,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/numberOtplogin.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.asset("assets/logo.png"),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.createAccount,
                                  arguments: true);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ColorResources.verifyScreenButton),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/look21.png",
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Login Now",
                                          textAlign: TextAlign.start,
                                          style: poppinsSemiBold.copyWith(
                                              fontSize: 14,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 0, left: 10, right: 10),
                      child: Container(
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  height: 470,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 5, left: 10, right: 10),
                                    child: WebView(
                                      initialUrl: initialUrl,
                                      onWebViewCreated:
                                          (webViewController) {
                                        _webViewController =
                                            webViewController;
                                      },
                                      onPageStarted: (String url) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                      },
                                      onPageFinished: (String url) {
                                        setState(() {
                                          isLoading = false;
                                          _webViewController!
                                              .runJavascriptReturningResult(
                                                  "document.getElementsByClassName('').style.display='none';");
                                          // "document.getElementsByClassName('elementor elementor-2727 elementor-location-footer')[0].style.display='none';");
                                        });
                                      },
                                      javascriptMode:
                                          JavascriptMode.unrestricted,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            if (isLoading)
                              Padding(
                                padding: const EdgeInsets.only(top: 200),
                                child: Center(
                                    child: CircularProgressIndicator()),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 150,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.aboutUsSCreen,
                                            arguments: true);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 5),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/672.png",
                                                  height: 30,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Text('About Us',
                                                      style: poppinsSemiBold
                                                          .copyWith(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black)),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.packageScreen,
                                            arguments: true);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 5),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/66.png",
                                                  height: 30,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Text('Packages',
                                                      style: poppinsSemiBold
                                                          .copyWith(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black)),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.bmiCalScreen,
                                            arguments: true);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 5),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/70.png",
                                                  height: 30,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Text('BMI Calculator',
                                                      style: poppinsSemiBold
                                                          .copyWith(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black)),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(RouteHelper.faqScreen,
                                            arguments: true);
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 5),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  "assets/67.png",
                                                  height: 30,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5),
                                                  child: Text('FAQs',
                                                      style: poppinsSemiBold
                                                          .copyWith(
                                                              fontSize: 14,
                                                              color: Colors
                                                                  .black)),
                                                )
                                              ],
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  int ind = 0;

  Widget _buildMedia(dynamic media, int index) {
    if (media['media_type'] == 'IMAGE') {
      return GestureDetector(
        onTap: () {},
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: media['media_url'],
          placeholder: (BuildContext context, String url) => Image.asset(
            "assets/Instagram_reels.png",
            height: 20,
            fit: BoxFit.contain,
            color: Colors.white,
          ),
          errorWidget: (BuildContext context, String url, dynamic error) =>
              const Icon(Icons.error),
        ),
      );
    } else if (media['media_type'] == 'VIDEO') {
      return GestureDetector(
        onTap: () {
          _playVideo(index);
        },
        child: Stack(
          children: [
            Container(
                child: VideoPlayer(_authController.videoControllers[index]!)),
            Positioned(
                top: 3,
                right: 3,
                child: Image.asset(
                  "assets/Instagram_reels.png",
                  height: 20,
                  color: Colors.white,
                )),
          ],
        ),
      );
    } else if (media['media_type'] == 'CAROUSEL_ALBUM') {
      String imageUrl = media["children"]["data"][ind]['media_url'];
      bool isImage = imageUrl.contains('.jpg') || imageUrl.contains('.png');
      return Stack(
        children: [
          if (isImage) ...[
            Positioned.fill(
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (BuildContext context, String url) =>
                        Image.asset(
                      "assets/Instagram_reels.png",
                      height: 20,
                      color: Colors.white,
                    ),
                    errorWidget:
                        (BuildContext context, String url, dynamic error) =>
                            Image.asset(
                      "assets/Instagram_reels.png",
                      height: 20,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ] else ...[
            GestureDetector(
              onTap: () {
                _playVide(ind);
              },
              child: Stack(
                children: [
                  Container(
                      child:
                          VideoPlayer(_authController.videoController[ind]!)),
                  Positioned(
                      top: 3,
                      right: 3,
                      child: Image.asset(
                        "assets/Instagram_reels.png",
                        height: 20,
                      )),
                ],
              ),
            )
          ],
          Positioned(
              right: 10,
              top: 60,
              bottom: 60,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    ind++;
                  });
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 10,
                  ),
                ),
              )),
          if (ind > 0) ...[
            Positioned(
                left: 5,
                top: 60,
                bottom: 60,
                child: InkWell(
                    onTap: () {
                      if (ind > 0) {
                        setState(() {
                          ind--;
                        });
                      }
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 10,
                      ),
                    )))
          ],
          Positioned(
              right: 0,
              top: 140,
              left: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0;
                      i < media['children']["data"].length;
                      i++) ...[
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        color: ind == i ? Colors.white70 : Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ]
                ],
              )),
        ],
      );
    }
    return SizedBox(); // Return an empty container for unsupported media types
  }
}
