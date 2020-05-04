import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sport_and_gamification/app/services/model_provider.dart';

class AccountInfo extends StatelessWidget {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future takeImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProvider>(
      builder: (context, model, child) => Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.blue[100],
                    child: ClipOval(
                      child: SizedBox(
                        width: 170.0,
                        height: 170.0,
                        child: model.player.image == null
                            ? Image.asset('assets/wikinger.png',
                                fit: BoxFit.contain)
                            : null,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Column(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.camera,
                              size: 30.0,
                            ),
                            onPressed: () {
                              takeImage();
                              return;
                            }),
                        IconButton(
                            icon: Icon(
                              FontAwesomeIcons.images,
                              size: 30.0,
                            ),
                            onPressed: () {
                              getImage();
                              return;
                            }),
                      ],
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    model.player.name,
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "\"${model.player.description}\"",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                  textScaleFactor: 1.1,
                )),
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.2,
              ),
              Text(model.player.history),
            ],
          )),
    );
  }
}
