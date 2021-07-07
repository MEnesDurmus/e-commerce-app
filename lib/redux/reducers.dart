import 'package:e_commerce_app/redux/actions.dart';
import 'package:e_commerce_app/redux/store.dart';
import 'store.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is IndexChangeAction) {
    return state.copyWith(currentIndex: action.index);
  }

  return state;
}
