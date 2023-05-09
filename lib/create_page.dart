import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final FirebaseUser user;

  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  File _image;

  @override
  void dispose() {
    //종료 메소드
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _bulidAppBar(),
      body: _bulidBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _bulidAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              //이미지 파일 업로드!!
              final firebaseStorageRef = FirebaseStorage.instance
                  .ref()
                  .child('post')
                  .child('${DateTime.now().millisecondsSinceEpoch}.png'); //이미지 경로 설정

              //이미지파일 및 타입 설정...
              final task = firebaseStorageRef.putFile(_image, StorageMetadata(contentType: 'image/png'));

              //이미지 파일 업로드가 완료 되면..
              task.onComplete.then((value) {
                var downloadUrl = value.ref.getDownloadURL();

                //이미지 url생성 되면!!
                downloadUrl.then((uri) {
                  var doc = Firestore.instance.collection('post').document();

                  doc.setData({
                    'id': doc.documentID,
                    'phoUrl': uri.toString(),
                    'contents': textEditingController.text,
                    'email': widget.user.email,
                    'displayName': widget.user.displayName,
                    'userPhotoUrl': widget.user.photoUrl,
                    'upTime': '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}  ${DateTime.now().hour}:${DateTime.now().minute}'
                  }).then((onValue) {
                    Navigator.pop(context); // 화면 종료
                  });
                });
              });
            })
      ],
    );
  }

  Widget _bulidBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _image == null
              ? Text(
                  'no image',
                )
              : Image.file(_image),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
          ),
          //Text("",maxLines: 1, style: TextStyle(fontSize: 10,color: Colors.redAccent),)
        ],
      ),
    );
  }

  Future _getImage() async {
    //비동기 처리...
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    File compressedFile = await FlutterNativeImage.compressImage(image.path, quality: 50, percentage: 50);

    setState(() {
      _image = compressedFile;
    });

  }
}
