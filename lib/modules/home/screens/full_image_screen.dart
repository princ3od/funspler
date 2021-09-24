import 'package:flutter/material.dart';
import 'package:funspler/general/constants/app_constant.dart';
import 'package:photo_view/photo_view.dart';

class FullImageScreen extends StatelessWidget {
  final String imageURL;
  final String tag;
  FullImageScreen({required this.imageURL, this.tag = ""});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('$tag'),
              backgroundColor: Colors.transparent,
            ),
            body: SafeArea(
              child: Hero(
                tag: (tag.isEmpty) ? imageURL : tag,
                child: PhotoView(
                  loadingBuilder: (context, event) => Center(
                    child: SizedBox(
                      width: AppConstant.kDouble_40,
                      height: AppConstant.kDouble_40,
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white)),
                    ),
                  ),
                  initialScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 1.0,
                  imageProvider: NetworkImage(imageURL),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
