import 'package:flutter/material.dart';
import 'package:study_snap/models/subject.dart';
import 'package:study_snap/models/topic.dart';
import 'package:study_snap/screens/topic_details.dart';
import 'package:study_snap/widgets/grid.dart';

class TopicWidget extends StatelessWidget {
  final Subject subject;
  final Topic topic;
  final ScrollController controller;

  TopicWidget({Key key, this.subject, this.topic, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TopicDetails(subject: subject, topic: topic),
              ),
            );
          },
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.collections,
                      size: 30,
                      color: Theme.of(context).accentColor,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          topic.title,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        subtitle: Padding(
                          padding: EdgeInsets.only(top: 7.5),
                          child: Text(
                            topic.description,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Expanded(
                  child: Grid(
                    topic: topic,
                    clickable: false,
                    controller: controller,
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
