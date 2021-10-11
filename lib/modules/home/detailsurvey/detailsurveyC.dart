import 'dart:async';
import 'dart:convert';
// ignore: unused_import
import 'dart:developer';
import 'package:get/get.dart';
import 'package:smart_survey1/data/models/survey/flowencode/linkM.dart';
import 'package:smart_survey1/data/models/survey/formencode/formencodeM.dart';
import 'package:smart_survey1/data/models/survey/formencode/idatumM.dart';
import 'package:smart_survey1/data/models/survey/surveydata/datumM.dart';
import 'package:smart_survey1/data/repositories/surveyR.dart';
import 'package:smart_survey1/modules/draft/draftC.dart';
import 'package:smart_survey1/utils/notification/dialogbarA.dart';
import 'package:smart_survey1/utils/service/networkC.dart';

class DetailSurveyC extends GetxController {
  //parsing data

  List getarguments = Get.arguments;

  //injection
  final surveyR = Get.find<SurveyR>();
  final networkC = Get.find<NetworkC>();
  final draftC = Get.find<DraftController>();

  //list //  Rx is an observable,
  // ignore: non_constant_identifier_names
  RxList<Idatum> temp_fix_array = <Idatum>[].obs;
  RxList<Idatum> answerData = <Idatum>[].obs;
  RxList<Idatum> fixQuestion = <Idatum>[].obs;

  // ignore: cancel_subscriptions
  late StreamSubscription getPositionSubscription;
  late Datum datum;

  RxBool isInAsyncCall = false.obs;
  RxBool isDraft = false.obs;
  RxBool isMaptrue = false.obs;

  @override
  void onInit() async {
    // print(datum.idProfile);
    isInAsyncCall.value = true;
    datum = getarguments[0];
    isDraft.value = getarguments[1];

    // log(datum.formEncode);

    // log(datum.flowEncode);

    await parseArray();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  /*

  This means that our controller will get deleted from memory as soon as the widgets using it are removed from the navigation stack
  */
  @override
  void onClose() async {
    if (isMaptrue.value == true) {
      getPositionSubscription.pause();
    } else {
      isMaptrue.value = false;
    }

    super.onClose();
  }

  Future<void> parseArray() async {
    isInAsyncCall.value = false;
    await surveyR.getFormEncodeData(datum).then((value) {
      //for each iddata
      if (value != null) {
        // ignore: non_constant_identifier_names
        value.forEach((fix_question) {
          //get instance of flowencode

          if (surveyR.getFlowEncode(datum) != null) {
            List<Link> list = surveyR.getFlowEncode(datum);

            list.forEach((floww) {
              if (fix_question.paramsend == floww.toconnector) {
                // print(listofiddata.paramsend + "-" + listoflink.toconnector);
                // print(true);
                fix_question.child = true;
                // print(listofiddata.child);
              } else {}
            });
            //
            resetvalue(fix_question);
            //tambah sebanyak jumlah listiddata

            fixQuestion.add(fix_question);
          }
        });
      }
    });
    addIndeks();
  }

  // ignore: non_constant_identifier_names
  resetvalue(Idatum fix_question) {
    if (isDraft.value == false) {
      if (fix_question.parenttype == "1" || fix_question.parenttype == "2") {
        fix_question.value = null;
      } else if (fix_question.parenttype == "5") {
        fix_question.value = "";

        fix_question.option.forEach((element) {
          element.value = false;
        });
      } else if (fix_question.parenttype == "4") {
        fix_question.value = "";

        fix_question.option.forEach((element) {
          element.value = false;
        });
      } else if (fix_question.parenttype == "3") {
        fix_question.value = "";

        fix_question.option.forEach((element) {
          element.value = false;
        });
      } else if (fix_question.parenttype == "12") {
        fix_question.value = "";
      } else if (fix_question.parenttype == "11") {
        fix_question.value = "";
      }
    }
  }

  addIndeks() {
    for (var i = 0; i < fixQuestion.length; i++) {
      fixQuestion[i].index_asli = i;

      if (isDraft.value == true) {
        if (fixQuestion[i].value != "") {
          temp_fix_array.add(fixQuestion[i]);
        }
      } else {
        if (fixQuestion[i].child != true) {
          temp_fix_array.add(fixQuestion[i]);
          // print(temp_fix_array);
        }
      }
    }

    // log(jsonEncode(temp_fix_array));
  }

  //paramsend dari parentquestion : 509
  //paramsendank dari value : 509
  deleteOption(index) {
    //kalau index parentnya
    // print(index);
    //kalau child sub question
    // print(child);

    // ignore: non_constant_identifier_names
    var del_child;

    del_child = true;

    // ignore: non_constant_identifier_names
    var first_to_delete;

    first_to_delete = null;

    // ignore: non_constant_identifier_names
    var count_to_delete;
    count_to_delete = 0;

    // ignore: non_constant_identifier_names
    for (var q_index = 0; q_index < temp_fix_array.length; q_index++) {
      //dilakukan check jika terdapat subquestion dari array parentquestion dan itu merupakan child
      if (q_index > index && temp_fix_array[q_index].child == true) {
        //terdapat childquestion yang perlu dihapus ketika memilih option lain maka akan dihapus jika childnya true
        // print(del_child);
        if (del_child) {
          if (first_to_delete == null) {
            first_to_delete = q_index;
            // print('delete indeks dimulai dari=' + first_to_delete.toString());
            count_to_delete = q_index;

            ++count_to_delete;
            // print('delete indeks sampai dari=' + count_to_delete.toString());
          } else {
            ++count_to_delete;
          }
        }
      } else if (q_index > index && temp_fix_array[q_index].child != true) {
        del_child = false;
      }
    }

    if (first_to_delete != null) {
      temp_fix_array.removeRange(first_to_delete, count_to_delete);

      temp_fix_array.refresh();

      // idgroup.removeRange(first_to_delete, count_to_delete);

    }
  }

  void getOption(index, child, paramsend, paramsendank) {
    /*
      fungsi buat delete child
      
    */
    //wajib tambahkan refresh untuk update data ketika terdapat action

    deleteOption(index);
    //looping jumlah option dari parentquestion : radio1,radio2
    // print(temp_fix_array);
    temp_fix_array.refresh();
    for (var idx = 0; idx < temp_fix_array[index].option.length; idx++) {
      // print(idx);

      /*
      cek jika option yang pertama : radio1, sama dengan option yang dipilih
      */
      // parentlabel radio 1 , child = ya(0),tidak(1)
      if (idx == child) {
        temp_fix_array[index].option[child].value = true;

        // print(temp_fix_array[index].option[idx].optionlabel);
        if (surveyR.getFlowEncode(datum) != null) {
          /*
          mengambil data list of link
          */
          // if (val == false) {
          //   val = true;
          //   print(val);
          // }

          List<Link> list = surveyR.getFlowEncode(datum);

          // ignore: non_constant_identifier_names
          list.forEach((flow_item) {
            // print(flowItem.fromconnector);

            /*
              cek jika terdapat fromconnector dari link, sama dengan question id+ question child id
              setiap kombinasi question id+ question child id , menghasilkan flow item connector yang berbeda
            */
            if (flow_item.fromconnector == paramsend + '~' + paramsendank) {
              // ignore: non_constant_identifier_names
              var paramsend_next = flow_item.toconnector;

              // ignore: non_constant_identifier_names
              fixQuestion.forEach((q_item) {
                //cek jika flow item connector menuju ke question id/question parent/child
                // print(q_item.paramsend);

                if (q_item.paramsend == paramsend_next) {
                  /*
                    reset data 
                  */
                  //reset value
                  if (q_item.value != null) {
                    if (q_item.parenttype == "1" || q_item.parenttype == "2") {
                      q_item.value = null;

                      temp_fix_array.insert(index + 1, q_item);
                    } else if (q_item.parenttype == "3") {
                      q_item.value = "";
                      q_item.option.forEach((element) {
                        element.value = false;
                      });
                      temp_fix_array.insert(index + 1, q_item);
                    } else if (q_item.parenttype == "4") {
                      q_item.value = "";

                      q_item.option.forEach((element) {
                        element.value = false;
                      });
                      temp_fix_array.insert(index + 1, q_item);
                    } else if (q_item.parenttype == "5") {
                      q_item.value = "";

                      q_item.option.forEach(
                        (element) {
                          element.value = false;
                        },
                      );
                      temp_fix_array.insert(index + 1, q_item);
                    } else if (q_item.parenttype == "12") {
                      temp_fix_array.insert(index + 1, q_item);
                      q_item.value = "";
                      q_item.image_path = "";
                    } else if (q_item.parenttype == "11") {
                      temp_fix_array.insert(index + 1, q_item);
                      q_item.value = "";
                    }
                    //berfungsi
                  } else if (q_item.value == null) {
                    //reset data
                    if (q_item.parenttype == "5") {
                      q_item.value = "";
                      temp_fix_array.insert(index + 1, q_item);
                      q_item.option.forEach(
                        (element) {
                          element.value = false;
                        },
                      );
                    }
                    //push data  //menambahan data array diposisi depan parentquestion [parentquestion , childquestion]
                    else if (q_item.parenttype == "4") {
                      temp_fix_array.insert(index + 1, q_item);
                    } else if (q_item.parenttype == "3") {
                      temp_fix_array.insert(index + 1, q_item);
                    } else if (q_item.parenttype == "1" ||
                        q_item.parenttype == "2") {
                      temp_fix_array.insert(index + 1, q_item);
                    } else if (q_item.parenttype == "12") {
                      temp_fix_array.insert(index + 1, q_item);
                    } else if (q_item.parenttype == "11") {
                      temp_fix_array.insert(index + 1, q_item);
                    }
                  }
                }
              });
            }
          });
        }
      } else {
        temp_fix_array[index].option[idx].value = false;
      }
    }

    // log(jsonEncode(temp_fix_array));
  }

  //safe di call berkali-kali
  checkDifference() {
    answerData.forEach((element) {
      //update value null // isi dengan null

      //reset value //hapus data survey yang tidak ditampilkan dalam form survey
      if (!temp_fix_array.contains(element)) {
        if (element.parenttype == "4" || element.parenttype == "3") {
          element.value = "";

          element.option.forEach((element) {
            element.value = "null";
          });
        } else if (element.parenttype == "1" || element.parenttype == "2") {
          element.value = "";
        } else if (element.parenttype == "5") {
          element.value = "";
          element.option.forEach((element) {
            element.value = false;
            // print(element.value);
          });
        } else if (element.parenttype == "12") {
          // print(element.parentlabel);
          element.value = "";

          // print(element.value.value);
        } else if (element.parenttype == "11") {
          // print(element.parentlabel);
          element.value = "";
        }
      }
    });
  }

  mergeAnswer() {
    for (var i = 0; i < temp_fix_array.length; i++) {
      fixQuestion.remove(temp_fix_array[i]);
    }

    for (var i = 0; i < temp_fix_array.length; i++) {
      fixQuestion.add(temp_fix_array[i]);
    }

    //one time add kalau gagal save nnti ga nambah lagi
    if (answerData.length == 0) {
      fixQuestion.forEach((element) {
        answerData.add(element);
      });
    }
    for (var i = 0; i < temp_fix_array.length; i++) {
      if (temp_fix_array[i].parenttype == "5") {
        for (var j = 0; j < temp_fix_array[i].option.length; j++) {
          if (temp_fix_array[i].parenttype == "5") {
            if (temp_fix_array[i].option[j].value == true) {
              // print('true');
              temp_fix_array[i].value = "value";
              break;
            } else {
              temp_fix_array[i].value = "";
              // print(temp_fix_array[i].value.value = "");
            }
          }
        }
      }
    }
  }

  //safe di call berkali-kali
  submitAnswer(String type) async {
    isInAsyncCall.value = true;

    //format type draft

    //format save
    mergeAnswer();

    List isSurveyEmpty =
        temp_fix_array.where((e) => e.value == null || e.value == "").toList();

    checkDifference();

    print(networkC.statusConnection.value);
    if (isSurveyEmpty.length != 0) {
      isInAsyncCall.value = false;
      DialogbarCustom.dialogError('Isi seluruh data.', 'Failed');
    } else if (type == "save") {
      if (networkC.statusConnection.value == "ONLINE") {
        saveAnswer();
      } else {
        DialogbarCustom.dialogError('Internet Not found', 'Failed');
        isInAsyncCall.value = false;
      }
    } else if (type == "draft") {
      saveDraft(answerData);
    }
  }

  saveAnswer() async {
    log(jsonEncode(answerData));
    await surveyR.sendAnswer(answerData, datum).then((value) {
      if (value != null) {
        if (value.info == "Success") {
          isInAsyncCall.value = false;
          // deleteSurvey(surveyR.newlistdatum, datum);
          if (isDraft.value == true) {
            draftC.deleteDraft(datum);
          } else {}

          DialogbarCustom.dialogSuccess(
              'Terima kasih Telah Mengisi Survey.', 'successful.');
        } else {
          isInAsyncCall.value = false;
          DialogbarCustom.dialogError(value.info, 'Failed');
        }
      } else {
        isInAsyncCall.value = false;
        DialogbarCustom.dialogError('No connection to server', 'Failed');
      }
    }).timeout(Duration(seconds: 5), onTimeout: () {
      isInAsyncCall.value = false;

      print('request time out');
    });
  }

  saveDraft(RxList<Idatum> answerData) {
    isInAsyncCall.value = true;

    //ubah json menjadi object
    FormEncode formEncodeObj =
        FormEncode.fromJson(jsonDecode(datum.formEncode));
    formEncodeObj.idata = answerData;
    //ubah object menjadi json
    datum.formEncode = jsonEncode(formEncodeObj);

    draftC.addDraft(datum);

    Future.delayed(
      Duration(milliseconds: 500),
      () => {
        isInAsyncCall.value = false,
        DialogbarCustom.dialogSuccess(
            'Draft Survey telah tersimpan .', 'successful.')
      },
    );
  }
}
