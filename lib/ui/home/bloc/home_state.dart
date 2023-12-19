part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final AppException exception;

  const HomeError({required this.exception});
  @override
  List<Object> get props => [exception];
}

class HomeSuccess extends HomeState {
  final List<BannerEntity> banners;
  final List<productEntity> latestProducts;
  final List<productEntity> popularProducts;

  HomeSuccess(
      {required this.banners,
      required this.latestProducts,
      required this.popularProducts});
}
