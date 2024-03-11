import 'package:flutter/material.dart';

import 'package:movies/features/home/presentation/views/widgets/section_sliver_list.dart';
import 'package:movies/features/home/presentation/views/widgets/sliver_app_bar_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [SliverAppBarSection(), SectionSliverList()],
    );
  }
}
