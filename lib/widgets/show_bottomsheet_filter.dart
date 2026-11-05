// ignore_for_file: library_private_types_in_public_api, deprecated_member_use, non_constant_identifier_names, camel_case_types, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/widgets/buttons.dart';
import 'package:rnn_yaatra/widgets/checkbox.dart';
 

class MultiSelectBottomSheetRiverpod extends ConsumerStatefulWidget {
  final String? title,input_title,show_key_name;
  final List? item_list,selected_list;
  final Function? callback_fn,onSearch;
  MultiSelectBottomSheetRiverpod({super.key,this.title,this.input_title,this.show_key_name,this.item_list,this.selected_list,this.callback_fn,this.onSearch});

  @override
  _MultiSelectBottomSheetRiverpodState createState() => _MultiSelectBottomSheetRiverpodState();
}

class _MultiSelectBottomSheetRiverpodState extends ConsumerState<MultiSelectBottomSheetRiverpod> {
  
  final selected_item_list_state = StateProvider((ref) => []);
  final filtered_item_list_state = StateProvider((ref) => []);
  
  @override
  void initState() {
    super.initState();
    setData();
  }

  setData() { 
    Future.delayed(Duration(milliseconds: 300),(){
      if(mounted){
        ref.read(filtered_item_list_state.notifier).update((state) => widget.item_list ?? []);
        ref.read(selected_item_list_state.notifier).update((state) => widget.selected_list ?? []);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var filtered_item_list = ref.watch(filtered_item_list_state);
    var selected_item_list = ref.watch(selected_item_list_state);
    return Scaffold(
      body: Padding(
      // height: Get.height,
      // width: Get.width,
      // decoration: BoxDecoration(
      //   color: AppColor.WHITE,
      // ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddVerticalSpacing(40),
          Row(
            children: [
              Expanded(child: Text( widget.title ?? "",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),),
              InkWell(
                onTap: (){
                  AppNav.back();
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColor.PRIMARY_COLOR.withOpacity(0.1),
                  child: Icon(Icons.close,size: 20,),
                ),
              )
            ],
          ),
          Divider(
            color: AppColor.GREY_LIGHT,
          ),
          AddVerticalSpacing(10),
          Container(
            decoration: BoxDecoration(
              color: AppColor.GREY_EXTRA_LIGHT,
              borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(Iconsax.search_normal,size: 20,),
                AddHorizontalSpacing(10),
                Expanded(child: TextFormField(
                  decoration: InputDecoration(
                    hintText: widget.input_title ?? "",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 13),
                  ),
                  onChanged: (string){
                    if(widget.onSearch != null){
                      widget.onSearch!(string);
                    }else{
                      if(string.toString().trim().isEmpty){
                        filtered_item_list = ref.refresh(filtered_item_list_state.notifier).update((state) => widget.item_list ?? []);
                      }else{
                        List result = widget.item_list!.where((item) => item.toString().toLowerCase().contains(string.toLowerCase()),).toList();
                        filtered_item_list = ref.read(filtered_item_list_state.notifier).update((state) => result);
                      } 
                    }
                    
                  },
                ))
              ],
            ),
          ),
          AddVerticalSpacing(20),
          Expanded(
            child: ListView.builder(
              itemCount: filtered_item_list.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                var item = filtered_item_list[index];
                List is_checked = selected_item_list.where((element) => element[widget.show_key_name].toString() == item[widget.show_key_name].toString(),).toList();
                // List is_checked = selected_skill_list.where((element) => element[show_key_name].toString() == item[show_key_name].toString(),).toList();

                // bool is_selected = item['selected'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: SizedBox(
                        height: 18,
                        width: 18,
                        child: primary_static_checkbox(
                          isSelected: is_checked.isNotEmpty ? true : false,
                          onTap: (){
                           if(is_checked.isNotEmpty){
                              selected_item_list.removeWhere((element) => element[widget.show_key_name].toString() == item[widget.show_key_name].toString(),);
                              selected_item_list = ref.refresh(selected_item_list_state.notifier).update((state) => selected_item_list);
                            }else{
                              selected_item_list.add(item);
                              selected_item_list = ref.refresh(selected_item_list_state.notifier).update((state) => selected_item_list);
                              filtered_item_list = ref.refresh(filtered_item_list_state.notifier).update((state) => filtered_item_list);
                            }
                          }
                        ),
                      ),
                      onTap: (){
                        if(is_checked.isNotEmpty){
                          selected_item_list.removeWhere((element) => element[widget.show_key_name].toString() == item[widget.show_key_name].toString(),);
                          selected_item_list = ref.refresh(selected_item_list_state.notifier).update((state) => selected_item_list);
                        }else{
                          selected_item_list.add(item);
                          selected_item_list = ref.refresh(selected_item_list_state.notifier).update((state) => selected_item_list);
                          filtered_item_list = ref.refresh(filtered_item_list_state.notifier).update((state) => filtered_item_list);
                        }
                      },
                      title: Text(item[widget.show_key_name],style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),),
                    ),
                    Divider(
                      height: 0,
                      color: AppColor.GREY_LIGHT,
                    ),
                  ],
                );
              },
            ),
          ),
          primaryButton(
            title: "Done",
            onTap: (){
              AppNav.back(); 
              if(widget.callback_fn != null){
                widget.callback_fn!(selected_item_list);
              }
            }
          ),
          AddVerticalSpacing(20),
        ],
      ),
    ),
    );
  }
}




class ShowFilterBottomsheetPageRiverpod extends ConsumerStatefulWidget {
  final String? title, inputTitle, filterKeyName, showKeyName;
  final List itemList;
  final Function? response, onSearchChange;

  const ShowFilterBottomsheetPageRiverpod({
    super.key,
    this.title,
    this.inputTitle,
    this.filterKeyName,
    this.showKeyName,
    required this.itemList,
    this.response,
    this.onSearchChange,
  });

  @override
  ConsumerState<ShowFilterBottomsheetPageRiverpod> createState() =>
      _ShowFilterBottomsheetPageState();
}

class _ShowFilterBottomsheetPageState
    extends ConsumerState<ShowFilterBottomsheetPageRiverpod> {
  List filterItemList = [];
  List displayedItems = [];

  final int itemsPerPage = 20;
  int currentPage = 1;

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    filterItemList = widget.itemList;
    loadInitialItems();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreItems();
      }
    });
  }

  void loadInitialItems() {
    setState(() {
      isLoading = true;
      displayedItems = filterItemList.take(itemsPerPage).toList();
      isLoading = false;
    });
  }

  void loadMoreItems() {
    setState(() {
      isLoading = true;
    });

    int startIndex = currentPage * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;

    if (startIndex < filterItemList.length) {
      if (endIndex > filterItemList.length) {
        endIndex = filterItemList.length;
      }

      displayedItems.addAll(
        filterItemList.sublist(startIndex, endIndex),
      );
      currentPage++;
    }

    setState(() {
      isLoading = false;
    });
  }

  void onSearch(String value) {
    if (widget.onSearchChange != null) {
      widget.onSearchChange!(value);
      return;
    }

    currentPage = 1;

    if (value.trim().isEmpty) {
      filterItemList = widget.itemList;
    } else {
      filterItemList = widget.itemList.where((item) {
        return item[widget.filterKeyName]
            .toString()
            .toLowerCase()
            .contains(value.toLowerCase());
      }).toList();
    }

    setState(() {
      displayedItems = filterItemList.take(itemsPerPage).toList();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.WHITE,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: AppColor.WHITE,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 50),
        
              /// Header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title ?? "",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor:
                          AppColor.PRIMARY_COLOR.withOpacity(0.1),
                      child: const Icon(Icons.close, size: 20),
                    ),
                  )
                ],
              ),
        
              const Divider(),
        
              const SizedBox(height: 10),
        
              /// Search
              Container(
                decoration: BoxDecoration(
                  color: AppColor.GREY_EXTRA_LIGHT,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Iconsax.search_normal, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.inputTitle ?? "",
                          border: InputBorder.none,
                        ),
                        onChanged: onSearch,
                      ),
                    )
                  ],
                ),
              ),
        
              const SizedBox(height: 10),
        
              /// List
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      if (isLoading)
                        const Center(child: CircularProgressIndicator()),
        
                      ListView.builder(
                        itemCount: displayedItems.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = displayedItems[index];
        
                          return Column(
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    widget.response?.call(item);
                                  },
                                  title: Text(
                                    item[widget.showKeyName],
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 0,
                                color: AppColor.GREY_LIGHT,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
