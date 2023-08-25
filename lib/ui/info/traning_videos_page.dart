import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owner/values/extensions/double_ext.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/navigation/navigation_service.dart';
import '../../../res.dart';
import '../../../values/colors.dart';
import '../../../values/string_contsant.dart';
import '../../../values/style.dart';

class TrainingVideosPage extends StatefulWidget {
  const TrainingVideosPage({Key? key}) : super(key: key);

  @override
  State<TrainingVideosPage> createState() => _OfferVideosPageState();
}

class _OfferVideosPageState extends State<TrainingVideosPage> {
  List<String> videoIdList = [];
  String videoUrl = "https://www.youtube.com/watch?v=u75GxuCnltI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.darkBlue,
        title: Text(
          StringConstant.trainingVideos,
          style: textBold.copyWith(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                navigator.pop();
              },
              child: Image.asset(
                Res.leftArrow,
                height: 39.h,
                width: 34.w,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColor.white,
          padding: EdgeInsets.only(bottom: 10.h),
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: AppColor.white,
                  padding: EdgeInsets.only(
                    left: 19.w,
                    right: 19.w,
                    top: 16.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Res.logo,
                            width: 31.w,
                            height: 31.h,
                          ),
                          11.w.HBox,
                          Text(
                            "CEO Cabs Offer For New Year",
                            style: textBold.copyWith(
                              fontSize: 16.sp,
                            ),
                          )
                        ],
                      ),
                      15.h.VBox,
                      Container(
                        height: 199.h,
                        width: 320.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: AppColor.accentColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.w),
                          child: CachedNetworkImage(
                            imageUrl: YoutubeThumbnail(
                              youtubeId: YoutubePlayer.convertUrlToId(
                                videoUrl.toString(),
                              ),
                            ).hd(),
                            height: 120.h,
                            //  width: Get.width,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            fadeInDuration: const Duration(milliseconds: 0),
                            fadeOutDuration: const Duration(milliseconds: 0),
                            placeholder: (context, url) => Image.asset(
                              Res.logo,
                              height: 120.h,
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              Res.logo,
                              height: 120.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: 3),
        ),
      ),
    );
  }
}
