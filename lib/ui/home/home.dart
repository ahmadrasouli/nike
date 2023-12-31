import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                        return Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('جدیدترین محصولات'),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text('مشاهده همه'))
                                ],
                              )
                            ],
                          ),
                        );
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
