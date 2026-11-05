// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, use_super_parameters
import 'dart:async';
import 'package:flutter/material.dart'; 
import 'package:rnn_yaatra/constants/colors.dart'; 
import 'package:masonry_grid/masonry_grid.dart'; 

class PaginatedListView<T> extends StatefulWidget {
  final List<T> items;
  final int itemsPerPage;
  final Widget Function(BuildContext context, T item,int index) itemBuilder;
  final Widget? separator;
  final EdgeInsetsGeometry padding;
  final List? search_key_names;

  const PaginatedListView({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.itemsPerPage = 20,
    this.separator,
    this.padding = const EdgeInsets.all(0),
    this.search_key_names
  }) : super(key: key);

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  int currentPage = 1;
  final txt_keyword = TextEditingController();

  List<T> filteredItems = [];
  bool isSearching = false;

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;

    txt_keyword.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    txt_keyword.dispose();
    _debounce?.cancel();
    super.dispose();
  }
 

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final keyword = txt_keyword.text.trim().toLowerCase();

      if (keyword.isNotEmpty) {
        setState(() {
          isSearching = true;
        });
      }

      await Future.delayed(const Duration(milliseconds: 300));

      if (keyword.isEmpty) {
        
        filteredItems = widget.items;
      } else {
        filteredItems = widget.items.where((item) {
          try {
            final data = item as dynamic;
            if (widget.search_key_names == null) return false;
            return widget.search_key_names!.any((key) {
              // print(":====== ${data.toJson()[key]}");
              final value = data.toJson()[key]?.toString().toLowerCase() ?? "";
              return value.contains(keyword.toLowerCase());
            });
          } catch (e) {
            return false;
          }
        }).toList();
        // print("::::: ${filteredItems.length}");
      }

      currentPage = 1;

      setState(() {
        isSearching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPages =
        (filteredItems.length / widget.itemsPerPage).ceil();

    int startIndex = (currentPage - 1) * widget.itemsPerPage;
    int endIndex =
        (startIndex + widget.itemsPerPage).clamp(0, filteredItems.length);

    List<T> paginatedItems =
        filteredItems.isNotEmpty ? filteredItems.sublist(startIndex, endIndex) : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //     border: Border.all(
        //         color: AppColor.PRIMARY_COLOR.withValues(alpha: 0.3)),
        //     borderRadius: BorderRadius.circular(10.0),
        //     color: AppColor.WHITE,
        //   ),
        //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
        //   child: Row(
        //     children: [
        //       Icon(Iconsax.search_normal,
        //           size: 20.0, color: AppColor.TEXT_GREY),
        //       AddHorizontalSpacing(10.0),
        //       Expanded(
        //         child: TextFormField(
        //           controller: txt_keyword,
        //           decoration: InputDecoration(
        //             border: InputBorder.none,
        //             hintText: "Search",
        //             hintStyle:
        //                 GoogleFonts.poppins(fontSize: 14.0),
        //           ),
        //         ),
        //       ),
        //       if (isSearching)
        //         const SizedBox(
        //           height: 18,
        //           width: 18,
        //           child: CircularProgressIndicator(strokeWidth: 2,color: AppColor.PRIMARY_COLOR,),
        //         )
        //     ],
        //   ),
        // ),

        // AddVerticalSpacing(15.0),

    
        if (isSearching)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(color: AppColor.PRIMARY_COLOR,),
            ),
          )
        else if (paginatedItems.isEmpty)
          const Center(child: Text("No Data Found"))
        else
          ListView.separated(
            itemCount: paginatedItems.length,
            shrinkWrap: true,
            padding: widget.padding,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) =>
                widget.separator ?? const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final item = paginatedItems[index];
              return widget.itemBuilder(context, item, index);
            },
          ),

        const SizedBox(height: 30),

     
        if (!isSearching && filteredItems.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: CircleAvatar(
                  backgroundColor: AppColor.GREY_LIGHT,
                  child: Icon(Icons.chevron_left,
                      color: AppColor.TEXT_DARK),
                ),
                onPressed: currentPage > 1
                    ? () {
                        setState(() {
                          currentPage--;
                        });
                      }
                    : null,
              ),
              Text('${currentPage} / $totalPages'),
              IconButton(
                icon: CircleAvatar(
                  backgroundColor: AppColor.PRIMARY_COLOR,
                  child: Icon(Icons.chevron_right,
                      color: AppColor.WHITE),
                ),
                onPressed: currentPage < totalPages
                    ? () {
                        setState(() {
                          currentPage++;
                        });
                      }
                    : null,
              ),
            ],
          ),
      ],
    );
  }
}







class PaginatedGridView<T> extends StatefulWidget {
  final List<T> items;
  final int itemsPerPage;
  final Widget Function(BuildContext context, T item,int index) itemBuilder;
  final Widget? separator;
  final EdgeInsetsGeometry padding;
  final List? search_key_names;
  final int column;

  const PaginatedGridView({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.itemsPerPage = 20,
    this.separator,
    this.padding = const EdgeInsets.all(0),
    this.search_key_names,
    this.column = 2
  }) : super(key: key);

  @override
  State<PaginatedGridView<T>> createState() => _PaginatedGridViewState<T>();
}

class _PaginatedGridViewState<T> extends State<PaginatedGridView<T>> {
  int currentPage = 1;
  final txt_keyword = TextEditingController();

  List<T> filteredItems = [];
  bool isSearching = false;

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;

    txt_keyword.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    txt_keyword.dispose();
    _debounce?.cancel();
    super.dispose();
  }
 

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final keyword = txt_keyword.text.trim().toLowerCase();

      if (keyword.isNotEmpty) {
        setState(() {
          isSearching = true;
        });
      }

      await Future.delayed(const Duration(milliseconds: 300));

      if (keyword.isEmpty) {
        
        filteredItems = widget.items;
      } else {
        filteredItems = widget.items.where((item) {
          try {
            final data = item as dynamic;
            if (widget.search_key_names == null) return false;
            return widget.search_key_names!.any((key) {
              // print(":====== ${data.toJson()[key]}");
              final value = data.toJson()[key]?.toString().toLowerCase() ?? "";
              return value.contains(keyword.toLowerCase());
            });
          } catch (e) {
            return false;
          }
        }).toList();
        // print("::::: ${filteredItems.length}");
      }

      currentPage = 1;

      setState(() {
        isSearching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPages =
        (filteredItems.length / widget.itemsPerPage).ceil();

    int startIndex = (currentPage - 1) * widget.itemsPerPage;
    int endIndex =
        (startIndex + widget.itemsPerPage).clamp(0, filteredItems.length);

    List<T> paginatedItems =
        filteredItems.isNotEmpty ? filteredItems.sublist(startIndex, endIndex) : [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         
    
        if (isSearching)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(color: AppColor.PRIMARY_COLOR,),
            ),
          )
        else if (paginatedItems.isEmpty)
          const Center(child: Text("No Data Found"))
        else MasonryGrid(
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          column: widget.column,
          children: List.generate(paginatedItems.length, (index) {
            final item = paginatedItems[index];
            return widget.itemBuilder(context, item, index);
          }),
        ),
          // ListView.separated(
          //   itemCount: paginatedItems.length,
          //   shrinkWrap: true,
          //   padding: widget.padding,
          //   physics: const BouncingScrollPhysics(),
          //   separatorBuilder: (context, index) =>
          //       widget.separator ?? const SizedBox(height: 8),
          //   itemBuilder: (context, index) {
          //     final item = paginatedItems[index];
          //     return widget.itemBuilder(context, item, index);
          //   },
          // ),
        

        const SizedBox(height: 30),

     
        if (!isSearching && filteredItems.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: CircleAvatar(
                  backgroundColor: AppColor.GREY_LIGHT,
                  child: Icon(Icons.chevron_left,
                      color: AppColor.TEXT_DARK),
                ),
                onPressed: currentPage > 1
                    ? () {
                        setState(() {
                          currentPage--;
                        });
                      }
                    : null,
              ),
              Text('${currentPage} / $totalPages'),
              IconButton(
                icon: CircleAvatar(
                  backgroundColor: AppColor.PRIMARY_COLOR,
                  child: Icon(Icons.chevron_right,
                      color: AppColor.WHITE),
                ),
                onPressed: currentPage < totalPages
                    ? () {
                        setState(() {
                          currentPage++;
                        });
                      }
                    : null,
              ),
            ],
          ),
      ],
    );
  }
}
