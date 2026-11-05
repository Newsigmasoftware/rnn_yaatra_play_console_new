import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/constants/constants.dart';
import 'package:rnn_yaatra/helpers/image_picker_helper.dart';
import 'package:rnn_yaatra/helpers/navigation_helper.dart';
import 'package:rnn_yaatra/models/master_models/get_bank_list_response_model.dart';
import 'package:rnn_yaatra/utils/screen_helper.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/strings_helper.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/view_models/account_view_models/edit_profile_view_model.dart';
import 'package:rnn_yaatra/view_models/account_view_models/get_profile_detail_view_model.dart';
import 'package:rnn_yaatra/view_models/master_view_model.dart';
import 'package:rnn_yaatra/widgets/app_bar.dart';
import 'package:rnn_yaatra/widgets/buttons.dart';
import 'package:rnn_yaatra/widgets/container_item.dart';
import 'package:rnn_yaatra/widgets/dilougs.dart';
import 'package:rnn_yaatra/widgets/image_view.dart';
import 'package:rnn_yaatra/widgets/show_bottomsheet_filter.dart';
import 'package:rnn_yaatra/widgets/text_fields.dart'; 


class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {

  final EditProfileViewModel editProfileViewModel = EditProfileViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      ref.read(getProfileViewModelNotifier.notifier).get_profile_detail(callbackFn: (profileDetailRes) {
        if(profileDetailRes.data != null){
          editProfileViewModel.txt_name.text = profileDetailRes.data?.username ?? "";
          editProfileViewModel.txt_email.text = profileDetailRes.data?.email ?? "";
          editProfileViewModel.txt_phone.text = profileDetailRes.data?.mobile ?? "";
          editProfileViewModel.txt_gender.text = profileDetailRes.data?.gender ?? "";
          editProfileViewModel.txt_aadhaar_no.text = profileDetailRes.data?.adharNo ?? "";
          editProfileViewModel.txt_pan_no.text = profileDetailRes.data?.panNo ?? "";
          editProfileViewModel.txt_address.text = profileDetailRes.data?.address ?? '';
          editProfileViewModel.txt_nominee.text = profileDetailRes.data?.nomineeName ?? "";
          editProfileViewModel.txt_nominee_relation.text = profileDetailRes.data?.nomineeRelation ?? "";
          editProfileViewModel.txt_nominee_relation_value.text = profileDetailRes.data?.nomineeRelation ?? "";
          editProfileViewModel.txt_acc_holder_name.text = profileDetailRes.data?.accHolderName ?? "";
          editProfileViewModel.txt_bank_name.text = profileDetailRes.data?.bankName ?? "";
          editProfileViewModel.txt_bank_value.text = profileDetailRes.data?.bankName ?? "";
          editProfileViewModel.txt_bank_branch.text = profileDetailRes.data?.branchName ?? "";
          editProfileViewModel.txt_account_no.text = profileDetailRes.data?.accountNo ?? "";
          editProfileViewModel.txt_ifsc_code.text = profileDetailRes.data?.ifsccode ?? "";

        }
      });

      ref.read(getMasterViewModelGlobalNotifier.notifier).get_bank_list();
    });
  }

  @override
  Widget build(BuildContext context) {
    var loadingProfile = ref.watch(getProfileViewModelNotifier).isLoadingProfile;
    var selectedProfile = ref.watch(editProfileViewModel.pageStateProvider).selectedProfile;
    var isLoading = ref.watch(editProfileViewModel.pageStateProvider).isLoading;
    var profileDetail = ref.watch(getProfileViewModelNotifier).getProfileDetailResponseModel;

    var isLoadingBank = ref.watch(getMasterViewModelGlobalNotifier).isLoadingBankList;
    var bankList = ref.watch(getMasterViewModelGlobalNotifier).bankListResponseModel;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Profile",
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            AddVerticalSpacing(20.0),
            loadingProfile ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text("Loading Details...",style: StyleHelper.popinsStyle(fontSize: 13.0,color: AppColor.PRIMARY_COLOR,fontWeight: FontWeight.w600),textAlign: TextAlign.right)),
                AddVerticalSpacing(5.0),
                LinearProgressIndicator(
                  color: AppColor.PRIMARY_COLOR,
                ),
                AddVerticalSpacing(15.0),
              ],
            ) : SizedBox(),
            
            Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
                    spreadRadius: 2.0,
                    offset: Offset(0, 2),
                    blurRadius: 6.0
                  )
                ]
              ),
              width: ScreenHelper().get_width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Top-Left Badge Header
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF0D47A1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.person,color: Colors.white, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                "Personal Information",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  AddVerticalSpacing(12.0),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("Address Proof Type",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        // AddVerticalSpacing(5.0),
                        // input_text_field(
                        //   bg_color: AppColor.WHITE,
                        //   isShadowHide: true,
                        //   hint_text: "Pan Card",
                        //   suffix_icon: Padding(
                        //     padding: EdgeInsets.only(top: 10),
                        //     child: Icon(Icons.arrow_drop_down,color: AppColor.GREY_MEDIUM,),
                        //   )
                        // ),

                        // AddVerticalSpacing(15.0),
                        Text("Full Name",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field( 
                          controller: editProfileViewModel.txt_name,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Full Name",
                          icon: Icon(Icons.person,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),
                        
                        AddVerticalSpacing(15.0),
                        Text("Email",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field( 
                          controller: editProfileViewModel.txt_email,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Email",
                          icon: Icon(Icons.email_outlined,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),
                        
                        
                        AddVerticalSpacing(15.0),
                        Text("Phone",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          controller: editProfileViewModel.txt_phone,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Phone",
                          icon: Icon(Icons.call,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),
                        
                        AddVerticalSpacing(15.0),
                        Text("Gender",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        CustomInkWell(
                          onTap: (){
                            List itemList = [
                              {"title" : "Male"},
                              {"title" : "Female"},
                            ];

                            AppNav.to(buildContext: context,ShowFilterBottomsheetPageRiverpod(
                              itemList: itemList,
                              filterKeyName: "title",
                              showKeyName: "title",
                              inputTitle: "Select Gender",
                              title: "Select Gender",
                              response: (res){
                                editProfileViewModel.txt_gender.text = res['title'];
                              },
                            ));

                          },
                          child: input_text_field(
                            readOnly: true,
                            controller: editProfileViewModel.txt_gender,
                            bg_color: AppColor.WHITE,
                            isShadowHide: true,
                            hint_text: "Select Gender",
                            icon: Icon(Icons.male,color: AppColor.TEXT_GREY,size: 20.0,),
                            suffix_icon: Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Icon(Icons.arrow_drop_down,color: AppColor.GREY_MEDIUM,))
                          ),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Aadhaar No.",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: editProfileViewModel.txt_aadhaar_no,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Aadhaar No.",
                          icon: Icon(Iconsax.card,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Pan No.",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: editProfileViewModel.txt_pan_no,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Pan No.",
                          icon: Icon(Iconsax.card,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Address",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field(
                          controller: editProfileViewModel.txt_address,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          is_textarea: true,
                          hint_text: "Enter Address",
                          icon: Icon(Iconsax.card,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Upload Photo",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        CustomInkWell(
                          onTap: (){
                            ImagePickerHelper.show_image_picker_dialog(
                              context,
                              pickFromCameraResult: (image){
                                ref.read(editProfileViewModel.pageStateProvider.notifier).setProfile(image: image);
                              },
                              pickFromGalleryResult: (image){
                                ref.read(editProfileViewModel.pageStateProvider.notifier).setProfile(image: image);
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.GREY_LIGHT),
                              color: AppColor.GREY_EXTRA_LIGHT.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.ORANGE_PENDING.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height: 60.0,
                                  width: 60.0,
                                  child: 
                                  !StringsHelper.is_empty_or_null("$selectedProfile") ? ClipRRect(
                                    borderRadius: BorderRadiusGeometry.circular(10.0),
                                    child: Image.file(File("$selectedProfile"),width: 60.0,height: 60.0,fit: BoxFit.cover,)) : 
                                    !StringsHelper.is_empty_or_null("${profileDetail?.data?.photo ?? ""}") ? show_simple_network_image(
                                      context,
                                      imageURL: "${APIURL.IMAGE_BASE_URL}${profileDetail?.data?.photo ?? ""}",
                                      height: 60.0,
                                      width: 60.0,
                                      fit: BoxFit.cover,
                                      radius: 10.0
                                    ) : 
                                    Icon(Iconsax.document_upload5,color: AppColor.ORANGE_PENDING,size: 32.0,),
                                ),
                                AddHorizontalSpacing(10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Not Uploaded",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                                      // Text(StringsHelper.is_empty_or_null("$selectedPanImage") ? "Not Uploaded" : "Pan Card Uploaded",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                                      Text("Supported formats: PNG, JPG, JPEG",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w400,color: AppColor.TEXT_GREY)),
                                      // Text("Max file size: 100KB",style: StyleHelper.popinsStyle(fontSize: 12.0,fontWeight: FontWeight.w400,color: AppColor.TEXT_GREY)),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.WHITE,
                                    border: Border.all(color: AppColor.PRIMARY_COLOR_SUPPORTIVE),
                                    borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                                  child: Center(
                                    child: Text("Upload",style: StyleHelper.popinsStyle(fontSize: 12.0,color: AppColor.ORANGE_PENDING,fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AddVerticalSpacing(15.0),

                ],
              ),
            ),


            AddVerticalSpacing(20.0),
            Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
                    spreadRadius: 2.0,
                    offset: Offset(0, 2),
                    blurRadius: 6.0
                  )
                ]
              ),
              width: ScreenHelper().get_width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Top-Left Badge Header
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF0D47A1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.person,color: Colors.white, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                "Nominee Details",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  AddVerticalSpacing(12.0),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("Address Proof Type",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        // AddVerticalSpacing(5.0),
                        // input_text_field(
                        //   bg_color: AppColor.WHITE,
                        //   isShadowHide: true,
                        //   hint_text: "Pan Card",
                        //   suffix_icon: Padding(
                        //     padding: EdgeInsets.only(top: 10),
                        //     child: Icon(Icons.arrow_drop_down,color: AppColor.GREY_MEDIUM,),
                        //   )
                        // ),

                        // AddVerticalSpacing(15.0),
                        Text("Nominee Name",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field( 
                          controller: editProfileViewModel.txt_nominee,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Nominee Name",
                          icon: Icon(Icons.person,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),
                        
                        AddVerticalSpacing(15.0),
                        Text("Nominee Relation",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        CustomInkWell(
                          onTap: (){
                            List itemList = [
                              {"title" : "Husband", "value" : "Husband"},
                              {"title" : "Wife", "value" : "Wife"},
                              {"title" : "Father", "value" : "Father"},
                              {"title" : "Mother", "value" : "Mother"},
                              {"title" : "Son", "value" : "Son"},
                              {"title" : "Daughter", "value" : "Daughter"},
                            ];

                            AppNav.to(buildContext: context,ShowFilterBottomsheetPageRiverpod(
                              itemList: itemList,
                              filterKeyName: "title",
                              showKeyName: "title",
                              inputTitle: "Select Nominee Relation",
                              title: "Select Nominee Relation",
                              response: (res){
                                editProfileViewModel.txt_nominee_relation.text = res['title'] ?? '';
                                editProfileViewModel.txt_nominee_relation_value.text = res['title'] ?? "";
                              },
                            ));

                          },
                          child: input_text_field( 
                            readOnly: true,
                            controller: editProfileViewModel.txt_nominee_relation,
                            bg_color: AppColor.WHITE,
                            isShadowHide: true,
                            hint_text: "Enter Nominee Relation",
                            icon: Icon(Icons.swap_vert,color: AppColor.TEXT_GREY,size: 20.0,),
                            suffix_icon: Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Icon(Icons.arrow_drop_down,color: AppColor.GREY_MEDIUM),
                            )
                          ),
                        ),
                        
                        
                         
                      ],
                    ),
                  ),
                  AddVerticalSpacing(15.0),

                ],
              ),
            ),


            AddVerticalSpacing(20.0),
            Container(
              decoration: BoxDecoration(
                color: AppColor.WHITE,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.GREY_LIGHT.withValues(alpha: 0.7),
                    spreadRadius: 2.0,
                    offset: Offset(0, 2),
                    blurRadius: 6.0
                  )
                ]
              ),
              width: ScreenHelper().get_width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Top-Left Badge Header
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF0D47A1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Iconsax.bank,color: Colors.white, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                "Bank Details",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  AddVerticalSpacing(12.0),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text("A/H Name",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field( 
                          controller: editProfileViewModel.txt_acc_holder_name,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter A/H Name",
                          icon: Icon(Icons.person,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),
                        
                        AddVerticalSpacing(15.0),
                        Text("Bank Name",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        isLoadingBank ? ProgressDialog().showLoadingDot() : CustomInkWell(
                          onTap: (){
                            List itemList = [];
                            bankList?.data?.forEach((element) => itemList.add(element.toJson()));
                            AppNav.to(buildContext: context,ShowFilterBottomsheetPageRiverpod(
                              itemList: itemList,
                              filterKeyName: GetBankListResponseModelItem.nameKey,
                              showKeyName: GetBankListResponseModelItem.nameKey,
                              inputTitle: "Select Bank",
                              title: "Select Bank",
                              response: (res){
                                GetBankListResponseModelItem item = GetBankListResponseModelItem.fromJson(res);
                                editProfileViewModel.txt_bank_name.text = item.name ?? "";
                                editProfileViewModel.txt_bank_value.text = item.id ?? "";
                              },
                            ));
                          },
                          child: input_text_field( 
                            readOnly: true,
                            controller: editProfileViewModel.txt_bank_name,
                            bg_color: AppColor.WHITE,
                            isShadowHide: true,
                            hint_text: "Enter Bank Name",
                            icon: Icon(Iconsax.bank,color: AppColor.TEXT_GREY,size: 20.0,),
                            suffix_icon: Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Icon(Icons.arrow_drop_down,color: AppColor.GREY_MEDIUM,),
                            )
                          ),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Bank Branch",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field( 
                          controller: editProfileViewModel.txt_bank_branch,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Bank Branch",
                          icon: Icon(Iconsax.building,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("Account No",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field( 
                          controller: editProfileViewModel.txt_account_no,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter Account No",
                          icon: Icon(Iconsax.hashtag,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),

                        AddVerticalSpacing(15.0),
                        Text("IFSC CODE",style: StyleHelper.popinsStyle(fontSize: 14.0,fontWeight: FontWeight.w600)),
                        AddVerticalSpacing(5.0),
                        input_text_field( 
                          controller: editProfileViewModel.txt_ifsc_code,
                          bg_color: AppColor.WHITE,
                          isShadowHide: true,
                          hint_text: "Enter IFSC CODE",
                          icon: Icon(Iconsax.bank,color: AppColor.TEXT_GREY,size: 20.0,),
                        ),
                        
                      ],
                    ),
                  ),
                  AddVerticalSpacing(15.0),

                ],
              ),
            ),


            AddVerticalSpacing(45.0),

            
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom: 5.0,top: 5.0),
          child: primaryButton(
            title: "Update Detail",
            onTap: (){
              editProfileViewModel.editProfile(ref, context);
            }
          ),
        ),
      ),
    );
  }
}