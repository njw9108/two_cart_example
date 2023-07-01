import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:two_cart_example/core/result/result.dart';
import 'package:two_cart_example/domain/repository/product_repository.dart';

import '../../../domain/model/product_item.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProductRepository productRepository;

  HomeCubit({
    required this.productRepository,
  }) : super(HomeInitial());

  Future<void> getProductItems() async {
    emit(
      HomeDataLoading(),
    );

    final result = await productRepository.getProductItmes();

    if (result is ResultSucess) {
      emit(
        HomeData(
          products: result.resultValue,
        ),
      );
    } else {
      final error = (result as ResultError).message;
      emit(
        HomeError(
          message: error,
        ),
      );
    }
  }
}
