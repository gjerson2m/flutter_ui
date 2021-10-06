import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:job_finder_ui/models/job.dart';

import 'item_job.dart';

class JobCarousel extends StatelessWidget {
  List<Job> jobs;

  JobCarousel(this.jobs);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: this.jobs.map((e) => ItemJob(e, themeDark: jobs.indexOf(e) == 0,)).toList(),
        options: CarouselOptions(
          enableInfiniteScroll: false,
          reverse: false,
          viewportFraction: 0.86,
          height: 230,
        )
    );
  }
}
