import 'package:flutter/widgets.dart';
import 'package:helsinki_events_app/src/api/myhelsinki_api.dart';

import '../bloc/myhelsinki_bloc.dart';

class MyHelsinkiProvider extends InheritedWidget {
  final MyHelsinkiBloc imageBloc;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  //this static function basically takes the context of the widget that calls it then it looks up the
  // widget tree because every widget can look up every context above it in the widget tree, so the of function
  // is given a context then looks up the tree to find a widget of type/instance ImageProvider then it is casted back to type
  //  ImageProvider just to let dart know that it is of type ImageProvider. then we pulls the imageBloc property of that widget.
  static MyHelsinkiBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MyHelsinkiProvider) as MyHelsinkiProvider)
          .imageBloc;

  // Since the Provider wraps a widget we need to define a constructor
  MyHelsinkiProvider({Key key, MyHelsinkiBloc imageBloc, Widget child})
      : this.imageBloc = imageBloc ?? MyHelsinkiBloc(MyHelsinkiApi()),
        super(child: child, key: key);
}