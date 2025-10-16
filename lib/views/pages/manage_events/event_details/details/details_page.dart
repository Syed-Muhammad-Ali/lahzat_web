import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lahzat_web/constants/colors.dart';
import 'package:lahzat_web/views/widgets/app_button.dart';
import 'package:lahzat_web/views/widgets/app_container.dart';
import 'package:lahzat_web/views/widgets/app_text.dart';
import 'package:lahzat_web/views/widgets/extension_sizebox.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Flexible(
              flex: 4,
              fit: FlexFit.loose,
              child: Column(
                children: [
                  AppContainer(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            infoColumn(title: "Date", value: "28/02/2025"),
                            4.wSpace(context),
                            infoColumn(title: "Time", value: "9:00 PM"),
                            4.wSpace(context),
                            infoColumn(title: "Event Type", value: "Wedding"),
                            4.wSpace(context),
                            infoColumn(title: "PIN", value: "PIN"),
                          ],
                        ),
                        3.hSpace(context),
                        Row(
                          children: [
                            infoColumn(
                              title: "Welcome Message",
                              value:
                                  "We’d love for you to be part of our memories",
                            ),
                          ],
                        ),
                        2.hSpace(context),
                      ],
                    ),
                  ),
                  2.hSpace(context),
                  AppContainer(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "QR Code",
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        ),
                        1.hSpace(context),
                        AppText(
                          "Your QR code is ready to be shared with  guests. You can download it or copy the link to share it directly.",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.black,
                        ),
                        1.hSpace(context),
                        Row(
                          children: [
                            Image.asset("assets/images/qr_code.png"),
                            1.hSpace(context),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    "QR Code",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff1D1C1B),
                                  ),
                                  1.hSpace(context),
                                  AppText(
                                    "Scan to RSVP",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff1D1C1B),
                                  ),
                                  1.hSpace(context),
                                  AppText(
                                    "Guests can scan this QR code to access your wedding website and RSVP directly.",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff1D1C1B),
                                  ),
                                  3.hSpace(context),
                                  AppButton(
                                    width: context.w * 0.13,
                                    height: 50,
                                    ontap: () {},
                                    label: 'Download QR Code',
                                    txtClr: AppColor.whiteColor,
                                    txtSize: 14,
                                    bgColor: AppColor.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        1.hSpace(context),
                      ],
                    ),
                  ),
                  2.hSpace(context),
                  AppContainer(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "Website",
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1D1C1B),
                        ),
                        1.hSpace(context),
                        AppText(
                          "Customize your website URL and QR code",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1D1C1B),
                        ),
                        2.hSpace(context),
                        Container(
                          width: 580,
                          height: 52,
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffEBEBEB),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                "www.lahzatona.com/sara-ali-wedding",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primaryColor,
                              ),
                              SvgPicture.asset(
                                "assets/icons/copy.svg",
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                        ),
                        2.hSpace(context),
                        AppText(
                          "Share this link with your clint. So they can access to their personalized event page and get all the moments from their guests",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryColor,
                        ),
                        2.hSpace(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Center(child: Image.asset("assets/images/pic.png")),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoColumn({
    required String title,
    required String value,
    Color titleColor = const Color(0xff222222),
    Color? valueColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: titleColor,
        ),
        1.hSpace(context),
        AppText(
          value,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: valueColor ?? AppColor.black,
        ),
      ],
    );
  }
}
