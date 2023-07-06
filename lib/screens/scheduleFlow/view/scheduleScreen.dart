import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instacare/Utils/Responsive.dart';
import 'package:instacare/Utils/appAssets.dart';
import 'package:instacare/Utils/appColor.dart';
import 'package:instacare/Utils/appStyle.dart';
import 'package:instacare/Utils/borderColor.dart';
import 'package:instacare/Utils/commonAppBar.dart';
import 'package:instacare/Utils/commonButton.dart';
import 'package:instacare/Utils/commonButtonSheet.dart';
import 'package:instacare/Utils/commonController.dart';
import 'package:instacare/Utils/commonDrower.dart';
import 'package:instacare/Utils/montserratText.dart';
import 'package:get/get.dart';
import 'package:instacare/Utils/pageNavigator.dart';
import 'package:instacare/screens/dashBoardFlow/view/addShiftFlow/addShiftScreenMain.dart';
import 'package:instacare/screens/dashBoardFlow/view/schedulefilterScreen.dart';
import 'package:instacare/screens/employeeSelectionFlow/controller/FacilityEmployeeSelectionController.dart';
import 'package:instacare/screens/scheduleFlow/controller/scheduleController.dart';
import 'package:instacare/screens/scheduleFlow/view/editScheduleShiftScreen.dart';

import '../../../Utils/interText.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final scheduleController = Get.put(ScheduleController());
  final cx = Get.put(CommonController());
  final globalKey = GlobalKey<ScaffoldState>();
  final FacilityEmployeeSelectionController c = Get.put(FacilityEmployeeSelectionController());
  Widget build(BuildContext context) {
    Reponsive_.init(context);
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      key: globalKey,
      body: Stack(
        children: [
          ListView(
            children: [
              // SizedBox(
              //   height: 140,
              //   child: ListView(
              //     physics: NeverScrollableScrollPhysics(),
              //     children: [
              //       EventCalendar(
              //         calendarType:  CalendarType.GREGORIAN,
              //         calendarLanguage: "en",
              //         showEvents: false,
              //         showLoadingForEvent: false,
              //         calendarOptions: CalendarOptions(
              //           headerMonthBackColor:AppColors.backGroundColor,
              //           viewType: ViewType.DAILY,
              //         ),
              //         onChangeDateTime: (value){
              //           print(value);
              //         },
              //         headerOptions:HeaderOptions(
              //           monthStringType: MonthStringTypes.FULL,
              //           weekDayStringType: WeekDayStringTypes.SHORT,
              //         ) ,
              //         dayOptions:DayOptions(
              //           selectedBackgroundColor: AppColors.yallow,
              //           showWeekDay: true,
              //           compactMode: true,
              //           unselectedBackgroundColor: AppColors.white,
              //           selectedTextColor: AppColors.black,
              //           weekDaySelectedColor: AppColors.yallow,
              //           unselectedTextColor: AppColors.hintTextGrey,
              //         ) ,
              //         events: null,
              //       ),
              //     ],
              //   ),
              // ),
              ListView.builder(
                  padding: EdgeInsets.only(top: 8, right: 10, left: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listItem.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          listItem[index].checkValue =
                              !listItem[index].checkValue;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: cx.width,
                        height: cx.height/10.5,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 20),
                                  height: cx.height,
                                  width: cx.width / 20,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      color: AppColors.greenDark),
                                ),
                                Center(
                                  child: Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      width: 20,
                                      height: 20,
                                      child: Checkbox(
                                          value: listItem[index].checkValue,
                                          shape: const CircleBorder(),
                                          activeColor: AppColors.buttonColor,
                                          onChanged: (val) {
                                            setState(() {
                                              listItem[index].checkValue = val!;
                                            });
                                          })),
                                ),
                              ],
                            ),
                            Gap(20.w),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, bottom: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InterText(
                                          text: listItem[index].position,
                                          fontWeight: FontWeight.w600,
                                          fontSize: Reponsive_.px18,
                                          color: AppColors.black,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InterText(
                                          text: listItem[index].center,
                                          fontWeight: FontWeight.w400,
                                          fontSize: Reponsive_.px14,
                                          color: AppColors.black,
                                        ),
                                        Row(
                                          children: [
                                            index == 5
                                                ? Image.asset(
                                                    AppAssets.userImage)
                                                : Container(),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            index == 3
                                                ? Container(
                                                    height: 16,
                                                    width: 15,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 10),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          126, 230, 155, 1),
                                                    ),
                                                  )
                                                : Container(),
                                            GestureDetector(
                                              child: Container(
                                                height: 16,
                                                width: 15,
                                                margin: const EdgeInsets.only(
                                                    right: 10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 3,
                                                    color: const Color.fromRGBO(
                                                        243, 48, 71, 1),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                CommonBottonSheet(
                                                    context: context,
                                                    topIcon: false,
                                                    childView: ListView(
                                                      shrinkWrap: true,
                                                      children: [
                                                        Container(
                                                          //padding: EdgeInsets.symmetric(horizontal: Reponsive_.crosslength*0.01,vertical: Reponsive_.crosslength*0.010),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color:
                                                                      AppColors
                                                                          .blue,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            25.0),
                                                                  )),
                                                          child: ListView(
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    width: 100,
                                                                    height: 3,
                                                                    color: AppColors
                                                                        .yallow,
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: Reponsive_
                                                                          .crosslength /
                                                                      60),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        MontserratText(
                                                                      text: "Shift Details"
                                                                          .toUpperCase(),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          Reponsive_
                                                                              .px12,
                                                                      color: Color.fromRGBO(
                                                                          255,
                                                                          255,
                                                                          255,
                                                                          0.3),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                  ),
                                                                  PopupMenuButton(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      icon: Image.asset(
                                                                          AppAssets
                                                                              .popMenuIcon),
                                                                      shape: const RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.all(Radius.circular(
                                                                              15.0))),
                                                                      onSelected: (x) async {
                                                                          if (x.toString() == "Delete") {
                                                                            CommonBottonSheet(
                                                                                context: context,
                                                                                childView: ListView(
                                                                                  shrinkWrap: true,
                                                                                  physics: NeverScrollableScrollPhysics(),
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      height: Reponsive_.crosslength/80,
                                                                                    ),
                                                                                    MontserratText(
                                                                                      text: "Schedule".toUpperCase(),
                                                                                      fontWeight: FontWeight.w400,
                                                                                      fontSize: Reponsive_.px12,
                                                                                      color: AppColors.blue,
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: Reponsive_.crosslength/35,
                                                                                    ),
                                                                                    MontserratText(
                                                                                      text: "Confirmation".toUpperCase(),
                                                                                      color: AppColors.redColor,
                                                                                      fontSize: Reponsive_.px30,
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: Reponsive_.crosslength/60,
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        RichText(
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: 'Do you really want to',
                                                                                                style: GoogleFonts.inter(
                                                                                                  color: AppColors.black,
                                                                                                  fontWeight: FontWeight.w400,
                                                                                                  fontSize: Reponsive_.px16,
                                                                                                ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: ' Delete ',
                                                                                                style: GoogleFonts.inter(
                                                                                                  color: AppColors.black,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontSize: Reponsive_.px16,
                                                                                                ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: 'shift(s)?',
                                                                                                style: GoogleFonts.inter(
                                                                                                  color: AppColors.black,
                                                                                                  fontWeight: FontWeight.w400,
                                                                                                  fontSize: Reponsive_.px16,
                                                                                                ),
                                                                                              ),
                                                                                            ]
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: Reponsive_.crosslength/25,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.only(left: 8,right: 8,bottom: Reponsive_.crosslength/80),
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: CommonButton(
                                                                                                text: "YES",
                                                                                                onTap: (){
                                                                                                  onBack(context);
                                                                                                  CommonBottonSheet(
                                                                                                      context: context,
                                                                                                      childView: ListView(
                                                                                                        shrinkWrap: true,
                                                                                                        physics: NeverScrollableScrollPhysics(),
                                                                                                        children: [
                                                                                                          SizedBox(
                                                                                                            height: Reponsive_.crosslength/80,
                                                                                                          ),
                                                                                                          MontserratText(
                                                                                                            text: "Schedule".toUpperCase(),
                                                                                                            fontWeight: FontWeight.w400,
                                                                                                            fontSize: Reponsive_.px12,
                                                                                                            color: AppColors.blue,
                                                                                                            textAlign: TextAlign.center,
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            height: Reponsive_.crosslength/35,
                                                                                                          ),
                                                                                                          MontserratText(
                                                                                                            text: "Shift Deleted",
                                                                                                            color: AppColors.redColor,
                                                                                                            fontSize: Reponsive_.px30,
                                                                                                            textAlign: TextAlign.center,
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            height: Reponsive_.crosslength/60,
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              RichText(
                                                                                                                text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: 'by Joel ',
                                                                                                                        style: GoogleFonts.inter(
                                                                                                                          color: AppColors.black,
                                                                                                                          fontWeight: FontWeight.w400,
                                                                                                                          fontSize: Reponsive_.px16,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: ' Newman  ',
                                                                                                                        style: GoogleFonts.inter(
                                                                                                                          color: AppColors.black,
                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                          fontSize: Reponsive_.px16,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: '(Instacare)',
                                                                                                                        style: GoogleFonts.inter(
                                                                                                                          color: AppColors.black,
                                                                                                                          fontWeight: FontWeight.w400,
                                                                                                                          fontSize: Reponsive_.px16,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ]
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          SizedBox(
                                                                                                            height: Reponsive_.crosslength/45,
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsets.only(left: Reponsive_.crosslength/10,right: Reponsive_.crosslength/10,bottom: Reponsive_.crosslength/60),
                                                                                                            child: CommonButton(
                                                                                                                text: "CLOSE",
                                                                                                                onTap:(){
                                                                                                                  onBack(context);/**/
                                                                                                                }
                                                                                                            ),
                                                                                                          )
                                                                                                        ],
                                                                                                      ),
                                                                                                  );
                                                                                                },
                                                                                              color: AppColors.redColor,
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            width: Reponsive_.crosslength/100,
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: CommonButton(
                                                                                                text: "NO, GO BACK",
                                                                                                onTap: (){
                                                                                                  onBack(context);
                                                                                                },
                                                                                              color: AppColors.buttonColor,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                            );
                                                                          } else if (x.toString() == "Edit Shift") {
                                                                               toPushNavigator(context: context,PageName: EditScheduleShift());
                                                                        } else if (x.toString() == "Close") {
                                                                          onBack(context);
                                                                        }
                                                                      },
                                                                      itemBuilder:
                                                                          (BuildContext context) =>
                                                                              <PopupMenuEntry>[
                                                                                PopupMenuItem(
                                                                                  value: "Delete",
                                                                                  child: Image.asset(AppAssets.deleteIcon, width: 70, height: 18),
                                                                                ),
                                                                                PopupMenuItem(
                                                                                  value: "Edit Shift",
                                                                                  child: Image.asset(AppAssets.editIcon, width: 70, height: 18),
                                                                                ),
                                                                                PopupMenuItem(
                                                                                  value: "Close",
                                                                                  child: Image.asset(AppAssets.closeIcon, width: 70, height: 18),
                                                                                ),
                                                                              ])
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: Reponsive_
                                                                          .crosslength *
                                                                      0.02),
                                                              MontserratText(
                                                                text:
                                                                    "7:00AM - 3:00PM",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize:
                                                                    Reponsive_
                                                                        .px30,
                                                                color: AppColors
                                                                    .white,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              SizedBox(
                                                                  height: Reponsive_
                                                                          .crosslength /
                                                                      40),
                                                              MontserratText(
                                                                text:
                                                                    "Friday, Feb 17 2023",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    Reponsive_
                                                                        .px16,
                                                                color: AppColors
                                                                    .white,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              SizedBox(
                                                                  height: Reponsive_
                                                                          .crosslength /
                                                                      50),
                                                              MontserratText(
                                                                text:
                                                                    "Elevate Care North Branch - LPN",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize:
                                                                    Reponsive_
                                                                        .px14,
                                                                color: AppColors
                                                                    .buttonColor,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              SizedBox(
                                                                  height: Reponsive_
                                                                          .crosslength /
                                                                      50),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Image.asset(
                                                                      AppAssets
                                                                          .location),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  MontserratText(
                                                                    text:
                                                                        "Elevate Care North Branch",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        Reponsive_
                                                                            .px14,
                                                                    color: AppColors
                                                                        .buttonColor,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: Reponsive_
                                                                          .crosslength /
                                                                      30),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: Reponsive_
                                                                  .crosslength /
                                                              40,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height: 16,
                                                              width: 16,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 2,
                                                                      color: AppColors
                                                                          .redColor)),
                                                            ),
                                                            SizedBox(
                                                              width: Reponsive_
                                                                      .crosslength /
                                                                  100,
                                                            ),
                                                            MontserratText(
                                                              text: "Open",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .black,
                                                              fontSize:
                                                                  Reponsive_
                                                                      .px12,
                                                            ),
                                                            SizedBox(
                                                              width: Reponsive_
                                                                      .crosslength /
                                                                  70,
                                                            ),
                                                            Image.asset(
                                                                AppAssets.flag),
                                                            SizedBox(
                                                              width: Reponsive_
                                                                      .crosslength /
                                                                  100,
                                                            ),
                                                            MontserratText(
                                                              text: "Incentive",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .black,
                                                              fontSize:
                                                                  Reponsive_
                                                                      .px12,
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: Reponsive_
                                                                  .crosslength /
                                                              15,
                                                        ),
                                                        InterText(
                                                          text: "2 Positions",
                                                          fontSize:
                                                              Reponsive_.px16,
                                                          color:
                                                              AppColors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          height: Reponsive_
                                                                  .crosslength /
                                                              15,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            left: Reponsive_
                                                                    .crosslength /
                                                                70,
                                                            right: Reponsive_
                                                                    .crosslength /
                                                                70,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    CommonButton(
                                                                  text: 'ASSIGN',
                                                                  onTap: () {
                                                                    CommonBottonSheet(
                                                                      context: context,
                                                                      childView: ListView(
                                                                        shrinkWrap: true,
                                                                        padding: EdgeInsets.only(left: 8,right: 8),
                                                                        physics: NeverScrollableScrollPhysics(),
                                                                        children: [
                                                                          SizedBox(
                                                                            height: Reponsive_.crosslength * 0.02,
                                                                          ),
                                                                          MontserratText(
                                                                            text: "Assign Shift(s)",
                                                                            fontWeight: FontWeight.w700,
                                                                            fontSize: Reponsive_.px24,
                                                                            color: AppColors.blue,
                                                                          ),
                                                                          SizedBox(
                                                                            height: Reponsive_.crosslength * 0.02,
                                                                          ),
                                                                          InterText(
                                                                            text: "Please select the person to whom you want to assign shift(s).",
                                                                            fontSize: Reponsive_.px16,
                                                                            color: AppColors.black,
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                          ListView.builder(
                                                                            padding: EdgeInsets.only(top: Reponsive_.crosslength*0.01),
                                                                            itemCount: c.facility_emp_arr.length,
                                                                            shrinkWrap: true,
                                                                            itemBuilder: (context, index) {
                                                                              return Obx(() => InkWell(
                                                                                onTap: () {
                                                                                  c.select_instacate_staff(index);
                                                                                },
                                                                                child: Container(
                                                                                  margin: EdgeInsets.only(
                                                                                    top: Reponsive_.crosslength * 0.018,
                                                                                    left: Reponsive_.crosslength * 0.015,
                                                                                    right: Reponsive_.crosslength * 0.015,
                                                                                  ),
                                                                                  child: Row(
                                                                                    children: [
                                                                                      Image.asset(
                                                                                        c.facility_emp_selection_arr[index]
                                                                                            ? 'assets/x/check.png'
                                                                                            : 'assets/x/uncheck.png',
                                                                                        height: Reponsive_.crosslength * 0.028,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: Reponsive_.crosslength * 0.02,
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Row(
                                                                                          children: [
                                                                                            Container(
                                                                                              height: Reponsive_.crosslength * 0.04,
                                                                                              width: Reponsive_.crosslength * 0.04,
                                                                                              decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                  image: DecorationImage(
                                                                                                      image: AssetImage(
                                                                                                        'assets/x/fecility_img.png',
                                                                                                      ),
                                                                                                      fit: BoxFit.cover)),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: InterText(
                                                                                                text: '   ${c.facility_emp_arr[index]}',
                                                                                                color: AppColors.black,
                                                                                                textOverflow: TextOverflow.ellipsis,
                                                                                                fontSize: Reponsive_.crosslength * 0.015,
                                                                                                fontWeight: FontWeight.w400,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      if(index!=0)...{
                                                                                        SizedBox(
                                                                                          width: Reponsive_.crosslength * 0.12,
                                                                                          child: Row(
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Container(
                                                                                                padding: EdgeInsets.symmetric(
                                                                                                    horizontal: Reponsive_.crosslength *
                                                                                                        0.02,
                                                                                                    vertical: Reponsive_.crosslength *
                                                                                                        0.007),
                                                                                                decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(
                                                                                                        Reponsive_.crosslength * 0.02),
                                                                                                    border: Border.all(
                                                                                                        color:BorderColorAll.getBorderColor(
                                                                                                            c.emp_position_arr[index])),
                                                                                                    color: BorderColorAll.getBgColor(
                                                                                                        c.emp_position_arr[index])),
                                                                                                child: InterText(
                                                                                                  text: c.emp_position_arr[index],
                                                                                                  color: BorderColorAll.getBorderColor(
                                                                                                      c.emp_position_arr[index]),
                                                                                                  fontSize: Reponsive_.crosslength * 0.013,
                                                                                                  fontWeight: FontWeight.w700,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      }
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              )
                                                                              );
                                                                            },
                                                                          ),
                                                                          SizedBox(
                                                                            height: Reponsive_.crosslength * 0.02,
                                                                          ),
                                                                          Row(
                                                                            children: [

                                                                              Expanded(
                                                                                  child: CommonButton(text: 'Assign', onTap: (){onBack(context);},height: Reponsive_.crosslength*0.06)
                                                                              ),
                                                                              SizedBox(
                                                                                width: Reponsive_.crosslength * 0.01,
                                                                              ),
                                                                              Expanded(
                                                                                  child: CommonButton(text: 'CANCEL', onTap: (){onBack(context);},color: AppColors.allGray,height: Reponsive_.crosslength*0.06,)
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height: Reponsive_.crosslength * 0.02,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: Reponsive_
                                                                        .crosslength /
                                                                    95,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    CommonButton(
                                                                  text: 'CLOSE',
                                                                  onTap: () {},
                                                                  color: AppColors
                                                                      .allGray,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: Reponsive_
                                                                  .crosslength /
                                                              40,
                                                        ),
                                                      ],
                                                    ));
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
              Gap(cx.height / 7)
            ],
          ),
          Padding(
            padding:   EdgeInsets.only(top: Reponsive_.crosslength*0.01,right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    child: Image.asset(AppAssets.filtetr),
                  onTap: (){
                    toPushNavigator(context: context,PageName: ScheduleFilterScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        margin: EdgeInsets.only(left: 8, bottom: 10),
        width: cx.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 16,
                  width: 15,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Color.fromRGBO(243, 48, 71, 1),
                    ),
                  ),
                ),
                MontserratText(
                  text: "Open",
                  fontSize: Reponsive_.px12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 16,
                  width: 15,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(126, 230, 155, 1),
                  ),
                ),
                MontserratText(
                  text: "Assigned",
                  fontSize: Reponsive_.px12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                )
              ],
            ),
            Row(
              children: [
                Image.asset(AppAssets.flag),
                Gap(8),
                MontserratText(
                  text: "Incentive",
                  fontSize: Reponsive_.px12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.verified_user,
                    color: Color.fromRGBO(126, 230, 155, 1)),
                MontserratText(
                  text: "Assigned",
                  fontSize: Reponsive_.px12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: Reponsive_.px30*2,
              child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(243, 48, 71, 1),
                onPressed: () {
                  CommonBottonSheet(
                    context: context,
                    childView: ListView(
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        MontserratText(
                          text: "Schedule",
                          color: AppColors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MontserratText(
                          text: "Confirmation",
                          color: AppColors.redColor,
                          fontSize: Reponsive_.px30,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        InterText(
                          text: "Do you really want to Delete shift(s)?",
                          fontWeight: FontWeight.normal,
                          fontSize: Reponsive_.px16,
                          color: AppColors.black,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CommonButton(
                                  text: "Yes",
                                  onTap: () {},
                                  color: AppColors.redColor,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: CommonButton(
                                  text: "No, Go Back",
                                  onTap: () {
                                    onBack(context);
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Image.asset(AppAssets.delete,scale: 1.2),
              ),
            ),
            Gap(10),
            SizedBox(
              height: Reponsive_.px30*2,
              child: FloatingActionButton(
                backgroundColor: AppColors.yallow,
                onPressed: () {
                  toPushNavigator(
                      context: context, PageName: const AddShiftScreen());
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<OpenShift> listItem = [
    OpenShift(
      position: "2 positions",
      center: "Care Center",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care North Branch ",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Care Center",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care North Branch ",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Care Center",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care",
      checkValue: false,
    ),
    OpenShift(
      position: "2 positions",
      center: "Elevate Care North Branch ",
      checkValue: false,
    ),
  ];
}

class OpenShift {
  String? position;
  String? center;
  bool checkValue;

  OpenShift({this.position, this.center, this.checkValue = false});
}