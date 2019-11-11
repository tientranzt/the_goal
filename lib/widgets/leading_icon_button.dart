import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

enum ChooseMedia { camera, gallery }

class LeadinguttonIcon extends StatefulWidget {
  @override
  _LeadinguttonIconState createState() => _LeadinguttonIconState();
}

class _LeadinguttonIconState extends State<LeadinguttonIcon> {
  File _image;

  Future _getSaveImage() async {
    File imageResult;
    try {
      await File('/data/user/0/thegoal.the_goal/app_flutter/profileImage.jpg')
          .exists()
          .then((isExists) {
        if (isExists) {
          imageResult = File(
              '/data/user/0/thegoal.the_goal/app_flutter/profileImage.jpg');
        } else {
          imageResult = null;
        }
      });
    } on FileSystemException catch (_) {
      imageResult = null;
    }
    _image = imageResult;
  }

  Future getImage(ChooseMedia media) async {
    if (media == ChooseMedia.camera) {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      var pathLocal = await getApplicationDocumentsDirectory();
      await image.copy('${pathLocal.path}/profileImage.jpg');
    }
    if (media == ChooseMedia.gallery) {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      var pathLocal = await getApplicationDocumentsDirectory();
      await image.copy('${pathLocal.path}/profileImage.jpg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getSaveImage(),
      builder: (context, snapshot) {
        return PopupMenuButton(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          onSelected: (ChooseMedia media) {
            getImage(media);
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<ChooseMedia>>[
            const PopupMenuItem<ChooseMedia>(
              value: ChooseMedia.gallery,
              child: ListTile(
                leading: Icon(
                  Icons.picture_in_picture,
                ),
                title: Text('From galaxy'),
              ),
            ),
            const PopupMenuItem<ChooseMedia>(
              value: ChooseMedia.camera,
              child: ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take picture'),
              ),
            ),
          ],
          child: Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.all(7),
              child: CircleAvatar(
                  backgroundImage: _image == null
                      ? AssetImage('assets/images/profile.jpg')
                      : FileImage(_image))),
        );
      },
    );
  }
}
