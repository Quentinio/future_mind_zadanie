import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/food_api.dart';
import 'blocks/food/food_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodBloc(
        RepositoryProvider.of<FoodApi>(context),
      )..add(LoadFoodEvent()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: const Text('Brawn Practice Task by Quentin'),
          ),
          body: BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              if (state is FoodLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FoodLoadedState) {
                return ListView.builder(
                    itemCount: state.posts.data?.children?.length,
                    itemBuilder: (_, index) {
                      var post = state.posts.data?.children?[index];
                      return Container(
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          color: Colors.deepOrange),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(post!.data!.linkFlairText
                                            .toString(), style: TextStyle(color: Colors.white),),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Flexible(
                                        child: Text(
                                          post.data!.title.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ))
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(post.data!.selftext.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.chat_bubble_outline,
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(width: 5),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        '${post.data!.numComments} comments',
                                        style: const TextStyle(
                                            color: Colors.black54),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Icon(
                                      Icons.share,
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(width: 5),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        ' Share',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Icon(
                                      Icons.bookmark_border,
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(width: 5),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        ' Save',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                    const Spacer(),
                                    Column(
                                      children: [
                                        const Icon(Icons.arrow_upward_rounded),
                                        Text(post.data!.ups.toString()),
                                        const Icon(
                                            Icons.arrow_downward_rounded),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }
              if (state is FoodErrorState) {
                return const Center(
                  child: Text('Ups..something went wrong, try again later.'),
                );
              }
              return Container();
            },
          )
      ),
    );
  }
}
