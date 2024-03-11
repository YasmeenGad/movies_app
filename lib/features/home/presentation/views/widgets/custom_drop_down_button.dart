import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/data/repos/trending_week_movie_imp.dart';
import 'package:movies/features/home/data/repos/trending_day_movie_imp.dart';

class CustomDropDownButton extends StatefulWidget {
  int uval;
  CustomDropDownButton({required this.uval});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        // color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.0.w),
          child: DropdownButton(
            onChanged: (value) {
              setState(() {
                trendingweek.clear();
                trendingday.clear();
                widget.uval =
                    int.parse(value.toString()); // Update dropdown value
              });
            },
            value: widget.uval,
            icon: Icon(
              Icons.arrow_drop_down_sharp,
              color: Colors.amber,
              size: 30.sp,
            ),
            items: [
              DropdownMenuItem(
                child: Text(
                  "Weekly",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 18.sp,
                  ),
                ),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text(
                  "Daily",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: 18.sp,
                  ),
                ),
                value: 2,
              )
            ],
          )),
    );
  }
}
