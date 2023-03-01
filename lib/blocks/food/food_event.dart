part of 'food_bloc.dart';

@immutable
abstract class FoodEvent {}

class LoadFoodEvent extends FoodEvent {
  @override
  List<Object?> get props => [];
}
