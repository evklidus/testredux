import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:testredux/redux/actions.dart';
import 'package:testredux/redux/app_state.dart';
import 'package:testredux/redux/reducers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store(reducer,
      initialState:
          AppState(widget: const Icon(Icons.image)));
    return StoreProvider(
      store: store,
      child: const MaterialApp(
        home: ImagePresent(),
      ),
    );
  }
}

class ImagePresent extends StatelessWidget {
  const ImagePresent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.all(16),
                child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (context, state) => state.widget,
                )),
            ElevatedButton(
              onPressed: () => store.dispatch(loadImageThunkAction(store)),
              child: const Text("Get image"),
            ),
          ],
        ),
      ),
    );
  }
}
