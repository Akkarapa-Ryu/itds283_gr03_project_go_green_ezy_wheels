import 'package:flutter/material.dart';
// https://www.youtube.com/watch?v=0ZHqrf0mzrI
containerImage(String thumbnail, double height, double width) {
  final urlDrive = thumbnail.split('/');
  final pathH = 'https://drive.google.com/uc?export=view&id=${urlDrive[5]}';

  // print('URL: $thumbnail');
  // print("Url Drive: $urlDrive");
  // print('Path: $pathH');
  return Image.network(
    pathH,
    height: height,
    width: width,
    fit: BoxFit.contain,
  );
}
