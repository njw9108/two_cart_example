import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/dependancy.dart';
import '../../domain/model/product_item.dart';
import 'home_cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인 화면'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) {
          return HomeCubit(
            productRepository: productRepository,
          );
        },
        child: const _HomeBodyWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _HomeBodyWidget extends StatefulWidget {
  const _HomeBodyWidget();

  @override
  State<_HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<_HomeBodyWidget> {
  @override
  void initState() {
    context.read<HomeCubit>().getProductItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeDataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeError) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('에러가 발생했습니다.'),
                Text(state.message),
              ],
            );
          } else if (state is HomeData) {
            return ListView.separated(
              itemBuilder: (_, index) => ProductItemCardWidget(
                item: state.products[index],
              ),
              itemCount: state.products.length,
              separatorBuilder: (_, index) => const Divider(
                color: Colors.grey,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class ProductItemCardWidget extends StatelessWidget {
  final ProductItem item;
  const ProductItemCardWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${item.name} : ${item.price}원'),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.amber,
            child: const Text('Add Cart'),
          ),
        ],
      ),
    );
  }
}
