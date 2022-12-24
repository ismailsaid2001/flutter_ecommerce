import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:testprofile/constants.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  var nameArticleController = TextEditingController();

  var priceArticleController = TextEditingController();

  var decriptionArticleController = TextEditingController();
  late File image;

  final PickedFile = ImagePicker();
   @override
     initState() {
  }
  uploadImage() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
      ScreenUtil.init(context, designSize: Size(414, 896), minTextAdapt: true);
      var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: kSpacingUnit.w * 3),
        Icon(
          LineAwesomeIcons.arrow_left,
          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        ),
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );
    return Scaffold(
        
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Text(
                  'Ajouter un Article ',
                  style: kTitleTextStyle ,
                ),
                SizedBox(
                  height: 10.0,
                ),
                 ElevatedButton(
                  onPressed: uploadImage,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        // <-- Icon
                        Icons.add_a_photo_sharp,
                        size: 24.0,
                      ),
                      
                      
                    ], 
                  ),
                   style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kAccentColor),
                      padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 15))),
                ),
                 SizedBox(
                  height: 20.0,
                ),
               image!=null? Image.file(image,height: 150.0,width:100.0):Image.asset('/assets/images/Avatar_Ismail.png') ,
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  style: kCaptionTextStyle,
                  controller: nameArticleController,
                  keyboardType: TextInputType.text,
                  onChanged: ((value) {
                    print(value);
                  }),
                  decoration: InputDecoration(
                      labelText: 'Nom de l\' Article',
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: Icon(Icons.article_outlined)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: kCaptionTextStyle,
                  controller: priceArticleController,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: ((value) {
                    print(value);
                  }),
                  decoration: InputDecoration(
                      labelText: 'Prix de l\' Article',
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: Icon(Icons.attach_money)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  style: kCaptionTextStyle,
                  minLines: 5,
                  maxLines: 8,
                  controller: priceArticleController,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: ((value) {
                    print(value);
                  }),
                  decoration: InputDecoration(
                      labelText: 'Description ',
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: Icon(Icons.attach_money)),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: IconButton(
                    color: kAccentColor,
                    highlightColor: Colors.white38,
                    splashColor: Colors.deepPurple,
                    disabledColor: Colors.deepPurple,
                    iconSize: 60,
                    onPressed: () {},
                    icon: Icon(Icons.add_circle_sharp),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
