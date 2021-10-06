import 'package:flutter/material.dart';
import 'package:job_finder_ui/models/job.dart';

class ItemJob extends StatefulWidget {
  bool themeDark;
  Job job;

  ItemJob(this.job, {this.themeDark = false});

  @override
  State<ItemJob> createState() => _ItemJobState();
}

class _ItemJobState extends State<ItemJob> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, bottom: 20, top: 20),
      child: Container(
        decoration: _boxDecoration(context),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _companyLogo(),
                  _favIcon(),
                ],
              ),
              _infoJobTexts(context),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration(context) {
    return BoxDecoration(
        color: this.widget.themeDark ? Theme.of(context).primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black45, offset: Offset(4, 4), blurRadius: 10)
        ]);
  }

  Widget _companyLogo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          this.widget.job.company.urlLogo,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _favIcon() {
    return GestureDetector(
      child: Icon(
        this.widget.job.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: this.widget.themeDark ? Colors.white : Colors.grey,
      ),
      onTap: (){
        setState(() {
          this.widget.job.isFavorite = !this.widget.job.isFavorite;
        });
      },
    );
  }

  Widget _infoJobTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.widget.job.company.name,
          style: TextStyle(
            fontSize: 15,
            color: this.widget.themeDark ? Color(0xffb7b7d2) : Colors.grey,
          ),
        ),
        Text(
          this.widget.job.role,
          style: this.widget.themeDark
              ? Theme.of(context).textTheme.headline3
              : Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).highlightColor,
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              this.widget.job.location,
              style: TextStyle(
                fontSize: 15,
                color: this.widget.themeDark ? Color(0xffb7b7d2) : Colors.grey,
              ),
            )
          ],
        )
      ],
    );
  }
}
