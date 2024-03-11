import 'package:flutter/material.dart';
import 'package:movies/features/home/presentation/views/widgets/sliver_app_bar_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBarSection(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Center(child: Text("Text")),
            ],
          ),
        ),
      ],
    );
  }
}
