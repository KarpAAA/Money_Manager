part of 'main_screen_bloc.dart';

abstract class MainScreenEvent{}

class LoadMainScreenEvent extends MainScreenEvent {
  final TransactionType type;

  LoadMainScreenEvent(this.type);
}
