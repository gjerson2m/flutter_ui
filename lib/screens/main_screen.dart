import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_finder_ui/components/job_carousel.dart';
import 'package:job_finder_ui/components/job_list.dart';
import 'package:job_finder_ui/models/company.dart';
import 'package:job_finder_ui/models/job.dart';

class MainScreen extends StatelessWidget {
  List<Job> forYouJobs = [
    Job(
      role: 'Product Designer',
      location: 'San Francisco, CA',
      company: Company(
        name: 'Google',
        urlLogo:
            'https://images.theconversation.com/files/93616/original/image-20150902-6700-t2axrz.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip',
      ),
    ),
    Job(
      role: 'Frontend Web',
      location: 'Miami',
      company: Company(
        name: 'Netflix',
        urlLogo:
            'https://i.pinimg.com/originals/8c/74/0b/8c740bc13bd5a0a19c24d28dff98cbdd.png',
      ),
    ),
    Job(
      role: 'Mobile Developer',
      location: 'New York',
      company: Company(
        name: 'Amazon',
        urlLogo:
            'https://www.cbc-network.org/wp-content/uploads/2017/11/Amazon-icon.png',
      ),
    ),
  ];

  List<Job> recentJobs = [
    Job(
      role: 'UX Enginner',
      location: 'Mountain View, CA',
      company: Company(
        name: 'Apple',
        urlLogo:
            'https://i.pinimg.com/originals/1c/aa/03/1caa032c47f63d50902b9d34492e1303.jpg',
      ),
      isFavorite: true,
    ),
    Job(
      role: 'Motion Designer',
      location: 'New York, NY',
      company: Company(
        name: 'AirBnb',
        urlLogo: 'https://menorcaaldia.com/wp-content/uploads/2018/02/air.jpg',
      ),
      isFavorite: true,
    ),
    Job(
      role: 'Python Developer',
      location: 'New York',
      company: Company(
        name: 'Amazon',
        urlLogo:
            'https://www.cbc-network.org/wp-content/uploads/2017/11/Amazon-icon.png',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _customAppBar(context),
            _textsHeader(context),
            _forYou(context),
            _recent(context),
          ],
        ),
      ),
    );
  }

  Widget _customAppBar(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            iconSize: 35.0,
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Row(
            children: [
              IconButton(
                iconSize: 40.0,
                icon: SvgPicture.asset('assets/icons/search.svg'),
                onPressed: () {},
              ),
              IconButton(
                iconSize: 40.0,
                icon: SvgPicture.asset('assets/icons/settings.svg'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _textsHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Gjerson2m',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Find your next',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'design job',
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
    );
  }

  Widget _forYou(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            'For You',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        JobCarousel(this.forYouJobs),
      ],
    );
  }

  Widget _recent(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Recientes',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Ver Todo',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        JobList(this.recentJobs),
        SizedBox(
          height: 40,
        )
      ],
    );
  }
}
