// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/constants/icons.dart';
import 'package:lahzat_web/models/manage_event_model.dart';
import 'package:lahzat_web/views/pages/create_new_event/create_new_event_page.dart';
import 'package:lahzat_web/views/pages/manage_events/components/event_table.dart';
import 'package:lahzat_web/views/pages/manage_events/event_details/event_details_page.dart';
import 'package:lahzat_web/views/pages/sideBar/sideBar_page.dart';
import 'package:lahzat_web/views/widgets/app_bar.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_container.dart';
import 'package:lahzat_web/views/widgets/app_pagination.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import 'package:lahzat_web/views/widgets/app_textfield.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

class ManageEventsPage extends StatefulWidget {
  const ManageEventsPage({super.key});

  @override
  State<ManageEventsPage> createState() => _ManageEventsPageState();
}

class _ManageEventsPageState extends State<ManageEventsPage> {
  static const int rowsPerPage = 6;
  int currentPage = 1;
  String searchQuery = '';
  List<UserItem> allUsers = List.generate(
    30,
    (i) => UserItem(
      sl: i + 1,
      name: [
        "Sara & Ali’s Wedding",
        "Kevin & Lila’s Baby Shower",
        "Rachel & Noah’s Graduation Party",
        "Marcus & Hannah’s Anniversary",
        "Megan & Josh’s Housewarming",
        "Jonas & Emily’s Engagement",
      ][i % 6],
      phone: "+972 545635282",
      avatar: "https://picsum.photos/200/200?random=${(i % 6) + 1}",
      date: [
        "2023-02-16 \n11:00AM",
        "2023-05-21 \n2:00PM",
        "2023-06-15 \n4:00PM",
        "2023-04-05 \n6:30PM",
        "2023-07-30 \n5:00PM",
        "2023-03-10 \n7:00PM",
      ][i % 6],
      category: [
        "Wedding",
        "Baby Shower",
        "Graduation",
        "Anniversary",
        "Housewarming",
        "Engagement",
      ][i % 6],
      paymentStatus: i % 2 == 0 ? "Paid" : "Pending",
      eventStatus: [
        "Upcoming",
        "Completed",
        "Cancelled",
        "Completed",
        "Completed",
        "Completed",
      ][i % 6],
    ),
  );

  List<UserItem> get filteredUsers {
    if (searchQuery.isEmpty) return allUsers;
    return allUsers
        .where(
          (user) => user.name.toLowerCase().contains(searchQuery.toLowerCase()),
          // ||
          // user.email.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = (filteredUsers.length / rowsPerPage).ceil();
    final start = (currentPage - 1) * rowsPerPage;
    final pageItems = filteredUsers.sublist(
      start,
      (start + rowsPerPage).clamp(0, filteredUsers.length),
    );

    return Container(
      color: AppColor.bgColor,
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
                                "Manage Events",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: AppColor.textColor,
                              ),
                              AppText(
                                "Manage Events",
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
                              // final sidebarState = context
                              //     .findAncestorStateOfType<SidebarPageState>();
                              // sidebarState?.openChildPage(
                              //   const CreateNewEventPage(),
                              // );
                              final sidebarState = context
                                  .findAncestorStateOfType<SidebarPageState>();
                              if (sidebarState != null) {
                                sidebarState.openChildPage(
                                  CreateNewEventPage(),
                                );
                                sidebarState.selectedIndex = 1;
                              }
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
                                  "Create New Event",
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
                                      flex: 3,
                                      child: TableHeader("Phone Number"),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TableHeader(
                                        "Date",
                                        sortable: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TableHeader(
                                        "Category",
                                        sortable: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TableHeader(
                                        "Payment",
                                        sortable: true,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: TableHeader(
                                        "Status ",
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
                                    return EventTableRow(
                                      index: index,
                                      event: pageItems[index],
                                      onMorePressed: () {},
                                      onTap: () {
                                        final sidebarState = context
                                            .findAncestorStateOfType<
                                              SidebarPageState
                                            >();
                                        sidebarState?.openChildPage(
                                          const EventDetailsPage(),
                                        );
                                      },
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
                          totalItems: filteredUsers.length,
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
