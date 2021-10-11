import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:smart_survey1/data/models/survey/surveydata/datumM.dart';
import 'package:smart_survey1/routes/route_name.dart';

import 'homeC.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Future<void> pullRefresh() async {
      controller.deleteDraft();
      await controller.getDataSurvey();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ('${controller.title}'),
          style: TextStyle(color: Colors.black),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: controller.isInAsyncCall.value,
          progressIndicator: Center(
            child: SpinKitDoubleBounce(
              color: Colors.white,
            ),
          ),
          child: SafeArea(
            child: RefreshIndicator(
                onRefresh: pullRefresh,
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.listsurvey.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: <Widget>[
                            checkPublish(
                              index,
                              controller.listsurvey[index],
                              context,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )),
          ),
        ),
      ),
    );
  }

  checkPublish(index, Datum datum, context) {
    if (controller.listsurvey[index].publish != "3") {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(RouteName.detailsurvey, arguments: [datum, false]);
              },
              child: Container(
                height: 200,
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 50,
                margin: EdgeInsets.only(top: 20, bottom: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    surveyInfo(datum),
                    Divider(
                      thickness: 2,
                    ),
                    surveyDate(datum)
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  surveyInfo(datum) {
    return ListTile(
      leading: Icon(
        Icons.content_paste,
        size: 50,
        color: Colors.red[900],
      ),
      title: Text(
        '${datum.judul}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        '${datum.deskripsi}',
        maxLines: 2,
        style: TextStyle(fontSize: 14),
      ),
      trailing: datum.masaAktif == "2" ? Text('Unlimited') : Text('On Going'),
    );
  }

  surveyDate(datum) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            leading: Icon(
              Icons.schedule,
              size: 30,
              color: Colors.black,
            ),
            title: Text('Tanggal Mulai'),
            subtitle: Text(
              '${datum.createDate}',
              maxLines: 1,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            leading: Icon(
              Icons.running_with_errors,
              size: 30,
              color: Colors.black,
            ),
            title: Text('Tanggal Berakhir'),
            subtitle: datum.masaAktif == "2"
                ? Text('None')
                : datum.masaAktif == "1"
                    ? Text(
                        '${datum.endDate}',
                        maxLines: 1,
                        style: TextStyle(fontSize: 14),
                      )
                    : Container(),
          ),
        ),
      ],
    );
  }
}
