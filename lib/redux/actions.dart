// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class GetImageAction {}

class LoadedImageAction {
  final Widget widget;

  LoadedImageAction(this.widget);
}

ThunkAction loadImageThunkAction = (Store store) async {
  store.dispatch(GetImageAction());
  _loadImage("https://avatars.yandex.net/get-music-content/2399641/b2f3d40a.p.755171/400x400")
      .then((image) => store.dispatch(LoadedImageAction(image)));
};

Future<Widget> _loadImage(String url) async {
  await Future.delayed(const Duration(seconds: 3));
  return Image.network(url);
}


