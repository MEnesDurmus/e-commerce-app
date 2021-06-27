import 'package:e_commerce_app/redux/actions.dart';
import 'package:e_commerce_app/redux/store.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is IndexChangeAction) {
    return AppState(currentIndex: action.index);
  }

  return state;
}
