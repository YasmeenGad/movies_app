import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/presentation/views/widgets/section_screen/movies.dart';
import 'package:movies/features/home/presentation/views/widgets/section_screen/tv_series.dart';
import 'package:movies/features/home/presentation/views/widgets/section_screen/upcoming.dart';

class SectionSliverList extends StatefulWidget {
  const SectionSliverList({super.key});

  @override
  State<SectionSliverList> createState() => _SectionSliverListState();
}

class _SectionSliverListState extends State<SectionSliverList>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Center(child: Text("Text")),
          Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            child: TabBar(
              physics: BouncingScrollPhysics(),
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.amber.withOpacity(0.4)),
              labelPadding: EdgeInsets.only(
                right: 10.w,
              ),
              controller: tabController,
              tabs: [
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text("TV Series"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text("Movies"),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text("UpComing"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 1.16,
            child: TabBarView(controller: tabController, children: [
              TVseries(),
              Movies(),
              UpComing(),
            ]),
          )
        ],
      ),
    );
  }
}
