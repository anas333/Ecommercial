import 'package:database_repo/database_repo.dart';
import 'package:ecommercial/Details/details.dart';
import 'package:ecommercial/app/bloc/database_bloc/database_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyshirtItem extends StatelessWidget {
  const MyshirtItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Shirts> shirt;

    final size = MediaQuery.of(context).size;

    return BlocBuilder<DatabaseBloc, DatabaseState>(
      builder: (context, state) {
        if (state is DatabaseInitial) {
          context.read<DatabaseBloc>().add(const DatabaseFetched());

          return const Center(child: CircularProgressIndicator());
        } else if (state is DatabaseSuccess) {
          if (state.listOfShirts.isEmpty) {
            return const Text('no data');
          } else {
            shirt = state.listOfShirts;

            return ListView.builder(
              itemCount: state.listOfShirts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push<MaterialPageRoute>(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(shirts: shirt[index]),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: size.width / 2.7,
                      height: size.height * (0.3),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              height: size.height * (0.2),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 46, 94, 73),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Image.network(
                              shirt[index].shirtImg,
                              height: size.height * (0.19),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: size.height * (0.24),
                            left: 20,
                            child: Text(
                              '${shirt[index].shirtPrice} \$',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 42, 104, 119),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            right: 5,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Color.fromARGB(255, 138, 194, 201),
                                size: 22,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
