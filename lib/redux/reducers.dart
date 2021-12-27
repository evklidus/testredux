import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:testredux/redux/app_state.dart';

import 'actions.dart';

AppState reducer(AppState state, dynamic action) => AppState(
      widget: _imageReducer(state.widget, action),
    );

Reducer<Widget> _imageReducer = combineReducers(
    [TypedReducer(_getImageReducer), TypedReducer(_loadedImageReducer)]);

Widget _getImageReducer(Widget widget, GetImageAction action) =>
    const Center(child: CircularProgressIndicator());

Widget _loadedImageReducer(Widget widget, LoadedImageAction action) =>
    action.widget;
