import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike2/data/product.dart';
import 'package:nike2/data/repo/banner_repository.dart';
import 'package:nike2/data/repo/product_repository.dart';
import 'package:nike2/ui/home/bloc/home_bloc.dart';
import 'package:nike2/ui/widgets/slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      final homeBloc = HomeBloc(
          bannerRepository: bannerRepository,
          productRepository: productRepository);
      homeBloc.add(HomeStarted());
      return homeBloc;
    }, child: Scaffold(
      // backgroundColor: Colors.grey.shade200,
      // appBar: AppBar(),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return ListView.builder(
                  itemCount: 5,
                  // padding: const EdgeInsets.fromLTRB(12, 12, 12, 100),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return SizedBox(
                            height: 100,
                            child: Image.asset('assets/img/nike.png'));
                      case 1:
                        return const SizedBox(
                          height: 10,
                        );
                      case 2:
                        return bannersSlider(
                          banners: state.banners,
                        );
                      case 3:
                        return _HorizontalProductList(
                          onTap: () {},
                          title: 'جدیدترین محصولات',
                          products: state.latestProducts,
                        );
                      case 4:
                        return _HorizontalProductList(
                          onTap: () {},
                          title: 'پربازدیدترین محصولات',
                          products: state.popularProducts,
                        );

                      default:
                        return Container();
                    }
                  });
            } else if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeError) {
              return Center(
                  child: Column(
                children: [
                  Text(state.exception.message),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context).add(HomeRefresh());
                      },
                      child: const Text('refresh'))
                ],
              ));
            } else {
              throw Exception('state is not supported');
            }
          },
        ),
      ),
    ));
  }
}

class _HorizontalProductList extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final List<productEntity> products;
  const _HorizontalProductList({
    required this.title,
    required this.onTap,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              TextButton(onPressed: onTap, child: const Text('مشاهده همه'))
            ],
          ),
        ),
        SizedBox(
          height: 290,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              padding: const EdgeInsets.only(left: 8, right: 8),
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 176,
                              height: 189,
                              child: Image.network(products[index].imageUrl)),
                          Text(products[index].title),
                          Text(products[index].previousPrice.toString()),
                          Text(products[index].price.toString()),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(150)),
                      )
                    ],
                  ))),
        )
      ],
    );
  }
}
