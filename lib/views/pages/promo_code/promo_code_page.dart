// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/models/promo_code_model.dart';
import 'package:lahzat_web/views/pages/promo_code/components/promoTableRow.dart';
import 'package:lahzat_web/views/widgets/app_bar.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_container.dart';
import 'package:lahzat_web/views/widgets/app_pagination.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';
import 'package:lahzat_web/views/widgets/custom_dialog_box.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

class PromoCodePage extends StatefulWidget {
  const PromoCodePage({super.key});

  @override
  State<PromoCodePage> createState() => _PromoCodePageState();
}

class _PromoCodePageState extends State<PromoCodePage> {
  static const int rowsPerPage = 6;
  int currentPage = 1;
  String searchQuery = '';

  List<PromoCodeItem> basePromoCodes = [
    PromoCodeItem(
      title: "Winter Sale",
      code: "WINTER25",
      generationDate: "2023-03-22\n5:00PM",
      validUntil: "2023-03-15\n9:00AM",
      discount: "\$5.00\nFixed",
      status: "Inactive",
    ),
    PromoCodeItem(
      title: "Summer Savings",
      code: "SUMMER15",
      generationDate: "2023-06-30\n11:59PM",
      validUntil: "2023-06-01\n10:00AM",
      discount: "20%\nPercentage",
      status: "Active",
    ),
    PromoCodeItem(
      title: "Valentine's Day Special",
      code: "VDAY15",
      generationDate: "2024-02-14\n11:59PM",
      validUntil: "2024-02-14\n9:00AM",
      discount: "\$6.00\nFixed",
      status: "Active",
    ),
    PromoCodeItem(
      title: "Holiday Cheer",
      code: "CHEER25",
      generationDate: "2023-12-25\n11:59PM",
      validUntil: "2023-12-01\n12:00AM",
      discount: "\$7.00\nFixed",
      status: "Active",
    ),
    PromoCodeItem(
      title: "New Year, New You",
      code: "NEWYOU10",
      generationDate: "2024-01-31\n11:59PM",
      validUntil: "2024-01-01\n12:00AM",
      discount: "20%\nPercentage",
      status: "Inactive",
    ),
    PromoCodeItem(
      title: "Back to School",
      code: "SCHOOL30",
      generationDate: "2023-09-15\n10:00PM",
      validUntil: "2023-08-15\n8:00AM",
      discount: "\$10.00\nFixed",
      status: "Active",
    ),
  ];

  List<PromoCodeItem> get allPromoCodes =>
      List.generate(30, (i) => basePromoCodes[i % basePromoCodes.length]);

  List<PromoCodeItem> get filteredPromoCodes {
    if (searchQuery.isEmpty) return allPromoCodes;
    return allPromoCodes
        .where(
          (code) =>
              code.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
              code.code.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = (filteredPromoCodes.length / rowsPerPage).ceil();
    final start = (currentPage - 1) * rowsPerPage;
    final pageItems = filteredPromoCodes.sublist(
      start,
      (start + rowsPerPage).clamp(0, filteredPromoCodes.length),
    );

    return Container(
      color: AppColor.bgColor,
      // height: double.infinity,
      child: Column(
        children: [
          AppBarWidgets(),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "Promo Code",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: AppColor.textColor,
                              ),
                              AppText(
                                "Manage all the Promo Codes",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.black,
                              ),
                            ],
                          ),
                          AppButton(
                            width: context.w * 0.16,
                            height: 50,
                            ontap: () {
                              CustomDialogBox(context);
                            },
                            rowElements: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: AppColor.whiteColor,
                                  size: 22,
                                ),
                                AppText(
                                  "Add New Code",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.whiteColor,
                                ),
                              ],
                            ),
                            // label: 'Sign in',
                            // txtClr: AppColors.white,
                            // txtSize: 16,
                            bgColor: AppColor.primaryColor,
                            label: '',
                          ),
                        ],
                      ),
                      1.hSpace(context),
                      Expanded(
                        child: AppContainer(
                          height: context.h * 0.22,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: AppTextfield(
                                        width: context.w * 0.4,
                                        ctr: TextEditingController(),
                                        hint: 'Search',
                                        filledColor: AppColor.filledColor,
                                        onchanged: (value) {
                                          setState(() {
                                            searchQuery = value;
                                            currentPage = 1;
                                          });
                                        },
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: SvgPicture.asset(
                                            AppIcons.search,
                                            color: Colors.black,
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 185,
                                      child: AppTextfield(
                                        ctr: TextEditingController(),
                                        hint: 'Custom',
                                        filledColor: AppColor.filledColor,
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: SvgPicture.asset(
                                            AppIcons.customCalender,
                                            color: Colors.black,
                                            height: 24,
                                            width: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // AppTextfield(
                              //   ctr: TextEditingController(),
                              //   hint: 'Search',
                              // ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor.withOpacity(.41),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColor.primaryColor,
                                      width: 0.5,
                                    ),
                                  ),
                                  // borderRadius: BorderRadius.circular(14),
                                ),
                                child: Row(
                                  children: const [
                                    Expanded(
                                      flex: 3,
                                      child: TableHeader("Title"),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TableHeader("Code"),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TableHeader(
                                        "Generation Date",
                                        sortable: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TableHeader(
                                        "Valid Until",
                                        sortable: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TableHeader(
                                        "Discount",
                                        sortable: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TableHeader(
                                        "Status",
                                        sortable: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: TableHeader("Actions"),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: pageItems.length,
                                  itemBuilder: (context, index) {
                                    return PromoTableRow(
                                      isEven: index.isEven,
                                      promo: pageItems[index],
                                      onMorePressed: () {},
                                      // onTap: () {
                                      //   // final sidebarState = context
                                      //   //     .findAncestorStateOfType<
                                      //   //       SideBarPageState
                                      //   //     >();
                                      //   // sidebarState?.openChildPage(
                                      //   //   const BookingsDetailsPage(),
                                      //   // );
                                      // },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      2.hSpace(context),
                      AppContainer(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          // vertical: 4,
                        ),
                        child: AppPagination(
                          currentPage: currentPage,
                          totalPages: totalPages,
                          totalItems: filteredPromoCodes.length,
                          pageSize: rowsPerPage,
                          onPageChanged: (page) {
                            setState(() {
                              currentPage = page;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
