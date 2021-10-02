import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:moneytime/components/createJob/create_job.dart';

class CreateJobPage extends StatelessWidget {
  const CreateJobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderCreateJob(),
          Expanded(
            child: CusomeTextField(),
          ),
        ],
      ),
    );
  }
}
