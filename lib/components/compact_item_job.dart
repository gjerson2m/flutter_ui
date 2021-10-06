import 'package:flutter/material.dart';
import 'package:job_finder_ui/models/job.dart';

class CompactItemJob extends StatefulWidget {
  Job job;

  CompactItemJob(this.job);

  @override
  State<CompactItemJob> createState() => _CompactItemJobState();
}

class _CompactItemJobState extends State<CompactItemJob> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
      child: Container(
        decoration: _boxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _companyLogo(),
              _infoJobTexts(context),
              _favIcon(context),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black26, offset: Offset(3, 3), blurRadius: 10)
        ]);
  }

  Widget _companyLogo() {
    return Image.network(
      this.widget.job.company.urlLogo,
      width: 70,
    );
  }

  Widget _infoJobTexts(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.widget.job.company.name,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(height: 5,),
        Text(
          this.widget.job.role,
          style: Theme.of(context).textTheme.headline4
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Theme.of(context).highlightColor,
              size: 14,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              this.widget.job.location,
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        )
      ],
    );
  }

  Widget _favIcon(context) {
    return GestureDetector(
      child: Icon(
        this.widget.job.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Theme.of(context).highlightColor,
      ),
      onTap: (){
        setState(() {
          this.widget.job.isFavorite = !this.widget.job.isFavorite;
        });
      },
    );
  }
}
