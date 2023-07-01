part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeDataLoading extends HomeState {}

class HomeError extends HomeState {
  final String message;

  const HomeError({
    required this.message,
  });
}

class HomeData extends HomeState {
  final List<ProductItem> products;

  const HomeData({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}
