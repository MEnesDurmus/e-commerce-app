abstract class Action {}

class IndexChangeAction extends Action {
  final int index;

  IndexChangeAction(this.index);
}
