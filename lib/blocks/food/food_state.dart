part of 'food_bloc.dart';

@immutable
abstract class FoodState {}

class FoodInitial extends FoodState {}


//loading state
class FoodLoadingState extends FoodState {
  @override
  List<Object?> get props => [];
}

class FoodLoadedState extends FoodState {
  final FoodModel food;

  FoodLoadedState(this.food);

  @override
  List<Object?> get props => [food];
}


class FoodErrorState extends FoodState {
  final String error;

  FoodErrorState(this.error);
  @override
  List<Object?> get props => [error];
}