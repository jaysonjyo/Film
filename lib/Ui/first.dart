import 'package:filmku/Repository/ModelClass/MovieModel.dart';
import 'package:filmku/Ui/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Bloc/movies_bloc.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  // List<String> imagelast = ["assets/d.png", "assets/e.png"]
  late MovieModel data;

  @override
  void initState() {
    BlocProvider.of<MoviesBloc>(context).add(FecthMovie());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text("FilmKu")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.notification_add_outlined,
              color: Colors.black,
            ),
          )
        ],
        leading: Icon(Icons.format_align_right),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Text(
                    "Now Showing",
                    style: TextStyle(
                        color: Color(0xFF110E47),
                        fontSize: 25.sp,
                        fontFamily: " Merriweather",
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: 115.w,
                  ),
                  Container(
                    width: 75.w,
                    height: 30.h,
                    decoration: ShapeDecoration(
                      color: Colors.white24,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(width: 1, color: Colors.black12)),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: SizedBox(
                height: 280.h,
                child: BlocBuilder<MoviesBloc, MoviesState>(
                  builder: (context, state) {
                    if (state is MoviesBlocLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is MovieBlocerror) {
                      return Center(
                        child: Text("Error"),
                      );
                    }
                    if (state is MoviesBlocLoaded) {
                      data = BlocProvider.of<MoviesBloc>(context).movieModel;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.movies!.length,
                        itemBuilder: (context, index) {
                          return TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => Screen2(
                                        img: data.movies![index].posterPath
                                            .toString(),
                                        textlast: data.movies![index].title
                                            .toString(), geners: data.movies![index].genres!, overview: data.movies![index].overview!.toString(),
                                      )));
                            },
                            child: Container(
                              width: 180.w,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        width: 220.w,
                                        height: 200.h,
                                        child: Image.network(data
                                            .movies![index].posterPath
                                            .toString())),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 1),
                                      child: Text(
                                        data.movies![index].title.toString(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                          letterSpacing: 0.28,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Row(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 20,
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 1,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          Text(
                                            '5.6',
                                            style: TextStyle(
                                              color: Color(0xFF9B9B9B),
                                              fontSize: 12.sp,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                              letterSpacing: 0.24,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 15.w,
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                        color: Color(0xFF110E47),
                        fontSize: 25.sp,
                        fontFamily: " Merriweather",
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    width: 185.w,
                  ),
                  Container(
                    width: 75.w,
                    height: 30.h,
                    decoration: ShapeDecoration(
                      color: Colors.white24,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(width: 1, color: Colors.black12)),
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  if(state is MoviesBlocLoading){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(state is MovieBlocerror){
                    return Center(child: Text("Error"),);
                  }
                  if(state is MoviesBlocLoaded){
                    data = BlocProvider.of<MoviesBloc>(context).movieModel;
                  return Container(height: 200*data.movies!.length.toDouble(),
                    child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount:data.movies!.length,physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 200.w,
                        height: 200.h,
                        decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Row(
                          children: [
                            Image.network(data.movies![index].posterPath.toString()),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width: 150,
                                  child: Text(
                                    data.movies![index].title.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.28,
                                    ),maxLines: 1,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      RatingBar.builder(
                                        itemSize: 20,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 1,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
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
                                          color: Color(0xFF9B9B9B),
                                          fontSize: 12.sp,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.24,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Container(
                                    height: 30.h,
                                    width: 200.w,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: data.movies![index].genres!.length,
                                      itemBuilder: (context, index1) {
                                        return Container(
                                          width: 70.w,
                                          height: 15.h,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFDBE3FF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              data.movies![index].genres![index1],
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
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          width: 5.w,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.schedule_outlined,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          '1h 47m',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                            letterSpacing: 0.24,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 30.h,
                      );
                    }),
                  );}
                  else{
                    return SizedBox();}
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
