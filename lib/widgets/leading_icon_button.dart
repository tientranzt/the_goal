import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

enum ChooseMedia { camera, gallery }

class LeadingButtonIcon extends StatefulWidget {
  @override
  _LeadingButtonIconState createState() => _LeadingButtonIconState();
}

class _LeadingButtonIconState extends State<LeadingButtonIcon> {
  File _image;

  void _getSaveImage() async {
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
    setState(() {
      _image = imageResult;
    });
  }

  Future getImage(ChooseMedia media) async {
    if (media == ChooseMedia.camera) {
      File image = await ImagePicker.pickImage(source: ImageSource.camera);
      Directory pathLocal = await getApplicationDocumentsDirectory();
      await image.copy('${pathLocal.path}/profileImage.jpg');
      setState(() {
        _image = image;
      });
    }
    if (ChooseMedia.gallery == media) {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);
      Directory pathLocal = await getApplicationDocumentsDirectory();
      await image.copy('${pathLocal.path}/profileImage.jpg');

      setState(() {
        _image = image;
      });
    }
  }

  @override
  void initState() {
    _getSaveImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
