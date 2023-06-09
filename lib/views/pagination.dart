import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:user_login_design/model/category.dart';
import 'package:user_login_design/service/category_service.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  static const routename = 'pagination_page';

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  final ScrollController scrollController = ScrollController();
  final List<Category> _categories = [];
  bool isLoading = false;
  final CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollcontroller);
    fetchData();
  }

  void _goToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void _scrollcontroller() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      fetchData();
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollcontroller);
    super.dispose();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    //duration delay
    // await Future.delayed(const Duration(seconds: 1));
    //list
    // List<int> newNumber =
    //     List.generate(11, (index) => index + numbers.length + 1);

    final List<Category> categories = await _categoryService.getCategories();

    setState(() {
      _categories.addAll(categories);
      isLoading = false;
    });
  }

  Future<void> refreshData() async {
    setState(() {
      isLoading = true;
      _categories.clear();
    });

    // await Future.delayed(
    //   const Duration(seconds: 1));
    //list
    // List<int> newnumbers = List.generate(11, (index) => index + ca.length);

    //
    final List<Category> categories = await _categoryService.getCategories();

    setState(() {
      _categories.addAll(categories);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: _goToTop,
        child: Icon(
          PhosphorIcons.bold.caretUp,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pagination List',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: ListView.builder(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: _categories.length + 1,
          itemBuilder: (context, index) {
            if (_categories.length == index) {
              return isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const Center(child: Text('more'));
            }
            return Card(
              child: ListTile(
                leading: Text(_categories[index].numberOfItems.toString()),
                title: Text(_categories[index].name),
                subtitle: Text(_categories[index].description),
                trailing: Image.network(_categories[index].imagePath),
              ),
            );
          },
        ),
      ),
    );
  }
}
