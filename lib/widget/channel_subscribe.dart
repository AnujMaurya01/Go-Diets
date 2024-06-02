// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class SubscribedCard extends StatelessWidget {
//   const SubscribedCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       child: ListView.builder(
//         itemCount: Global.songs.length,
//         itemBuilder: (context, i) => Container(
//           height: MediaQuery.of(context).size.height * 0.15,
//           margin: const EdgeInsets.symmetric(horizontal: 0),
//           decoration: BoxDecoration(
//             border: Border(
//               bottom: BorderSide(
//                   color: ColorResources.loginButtonColor.withOpacity(0.3)),
//             ),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 7),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               InkWell(
//                 onTap: () {
//                   Get.toNamed(RouteHelper.getChannelRoute());
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 100,
//                       height: MediaQuery.of(context).size.height * 0.11,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10.0),
//                         child: Image.asset(
//                           "${Global.songs[i]["image"]}",
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 5.0),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           'Channel Name',
//                           style: montserratBold.copyWith(
//                             fontSize: Dimensions.smallFont,
//                             //color: ColorResources.textColo.withOpacity(0.8)
//                           ),
//                         ),
//                         SizedBox(
//                           height: Dimensions.borderRadius,
//                         ),
//                         Text(
//                           'Each episode of The Daily Good...',
//                           style: montserratRegular.copyWith(
//                             fontSize: Dimensions.smallFont,
//                             // color: ColorResources.textColo.withOpacity(0.9)
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
