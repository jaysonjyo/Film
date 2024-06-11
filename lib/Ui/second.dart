import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class Screen2 extends StatefulWidget {
  final String textlast;
  final String img;
  final List<String> geners;
  final String overview;

  const Screen2({super.key, required this.img, required this.textlast, required this.geners, required this.overview});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<String> textbox = ["ACTION", "ADVENTURE", "FANTASY"];
  List<String> imagebox = [
    "assets/f.png",
    "assets/g.png",
    "assets/h.png",
    "assets/i.png"
  ];
  List<String> textlast = [
    "Tom Holland",
    "Zendaya",
    "Benedict\nCumberbatch",
    "Jacon\nBatalon"
  ];

  // late FlickManager flickManager;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   flickManager = FlickManager(
  //       videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
  //           "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4")));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 280.h,
            width: double.infinity,
            child: Image.network(widget.img),
            // child: Center(child: FlickVideoPlayer(flickManager: flickManager)),
          ),
          Container(
            width: 500.w,
            height: 532.h,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          SizedBox(width: 200,
                            child: Text(
                              widget.textlast,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: "mulish",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),

                          SizedBox(
                            width: 130.w,
                          ),
                          Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 1,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                           "5.6",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: 'Mulish',
                              fontWeight: FontWeight.w200,
                              height: 0,
                              letterSpacing: 0.28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30.h,
                      child: ListView.separated(
                          itemCount: widget.geners.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 80.w,
                              height: 10.h,
                              decoration: ShapeDecoration(
                                  color: Color(0xFFDBE3FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Center(
                                child: Text(
                                  widget.geners[index],
                                  style: TextStyle(
                                    color: Color(0xFF87A3E8),
                                    fontSize: 11.sp,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.16,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 10.w,
                            );
                          }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Length',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 22.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.24,
                                ),
                              ),
                              Text(
                                '2h 28min',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.24,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 23.w,
                          ),
                          Column(
                            children: [
                              Text(
                                'Language',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 22.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.24,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 45),
                                child: Text(
                                  'English',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 23.w,
                          ),
                          Column(
                            children: [
                              Text(
                                'Rating',
                                style: TextStyle(
                                  color: Color(0xFF9B9B9B),
                                  fontSize: 22.sp,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.24,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(
                                  'PG-13',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        color: Color(0xFF110E47),
                        fontSize: 20.sp,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.overview,
                      style: TextStyle(
                        color: Color(0xFF9B9B9B),
                        fontSize: 13.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Cast',
                          style: TextStyle(
                            color: Color(0xFF110E47),
                            fontSize: 22.sp,
                            fontFamily: 'Merriweather',
                            fontWeight: FontWeight.w900,
                            height: 0,
                            letterSpacing: 0.32,
                          ),
                        ),
                        SizedBox(
                          width: 240,
                        ),
                        Container(
                          width: 75.w,
                          height: 30.h,
                          decoration: ShapeDecoration(
                            color: Colors.white24,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: BorderSide(
                                    width: 1, color: Colors.black12)),
                          ),
                          child: Center(
                              child: Text(
                            "See More",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15.sp,
                                fontFamily: "Mulish",
                                fontWeight: FontWeight.w400),
                          )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      height: 190.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                              width: 130.w,
                              height: 200.h,
                              decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Column(
                                children: [
                                  Image.asset(
                                    imagebox[index],
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      textlast[index],
                                      style: TextStyle(
                                          color: Color(0xFF110E47),
                                          fontSize: 18,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w400,
                                          height: 1),
                                    ),
                                  )
                                ],
                              ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 20.w,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
