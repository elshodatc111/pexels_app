import 'package:auth_register/serves/storage/storage_serves.dart';
import 'package:auth_register/ui/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12.0,
        ),
        const SearchBar(),
        const SizedBox(
          height: 12.0,
        ),
        Expanded(
          child: Consumer<MainProvider>(
            builder: (context, provider, _) {
              return provider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                      ),
                      itemCount: provider.images.length,
                      itemBuilder: (context, index) {
                        var imageData = provider.images[index];
                        return Container(
                          width: double.infinity,
                          height: 200,
                          margin: const EdgeInsets.only(bottom: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.red,
                          ),
                          child: Stack(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imageData['src']['original'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white,
                                      Colors.grey,
                                    ],
                                  ),
                                ),
                                child: const SizedBox(
                                  width: double.infinity,
                                  height: 200,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        List forvard = StorageServes.get('forwards')??[];
                                        forvard.add({
                                          'image':imageData['src']['original']
                                        });
                                        StorageServes.put('forwards', forvard);
                                        print(imageData['src']['original']);
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        onChanged: (value) {
          context.read<MainProvider>().searchImage();
        },
        controller: context.watch<MainProvider>().searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
