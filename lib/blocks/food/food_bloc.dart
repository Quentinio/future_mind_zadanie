import 'package:bloc/bloc.dart';
import 'package:future_mind_zadanie/api/food_api.dart';
import 'package:future_mind_zadanie/blocks/models/food_model.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodApi _foodApi;

  FoodBloc(this._foodApi) : super(FoodInitial()) {
    on<FoodEvent>((event, emit) async {
      emit(FoodLoadingState());
      try {
        final food = await _foodApi.getPosts();
        emit(FoodLoadedState(food));
      } catch(e) {
        emit(FoodErrorState(e.toString()));
      }
    });
  }
}
