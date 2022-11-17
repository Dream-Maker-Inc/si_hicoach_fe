import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:si_hicoach_fe/common/file_picker/file_picker_extension.dart';
import 'package:si_hicoach_fe/domain/common/inbody/models/inbody_model.dart';
import 'package:si_hicoach_fe/common/shared_preferences/key.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/get_member_studies_response.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/update_inBody_dto.dart';
import 'package:si_hicoach_fe/infrastructure/study/dto/upload_today_inBody_dto.dart';
import 'package:si_hicoach_fe/infrastructure/study/study_api.dart';

class InBodyViewModel extends _FetchController {
  int memberId = 0;
  int matchingId = 0;

  RxList<InBodyModel> inBodyModels = RxList();
  RxnString loadingMsg = RxnString(null);

  // upload InBody
  RxBool uploadTodayInBodySuccess = false.obs;

  uploadTodayInBody(FilePickerResult filePickerResult) async {
    final multipartFiles = await Future.wait(
        filePickerResult.files.map((it) => it.toMultipartFile));

    final dto =
        UploadTodayInBodyDto(matchingId: matchingId, files: multipartFiles);

    loadingMsg("파일 업로드 중 입니다.");
    final result = await StudyApi.uploadTodayInBody(dto);

    result.when((e) => (apiError.value = e),
        (response) => (uploadTodayInBodySuccess.value = response));
  }

  // update InBody
  RxBool updateInBodySuccess = false.obs;

  updateInBody(int studyId, FilePickerResult filePickerResult) async {
    final multipartFiles = await Future.wait(
        filePickerResult.files.map((it) => it.toMultipartFile));

    final dto = UpdateInBodyDto(multipartFiles);

    loadingMsg("파일 업로드 중 입니다.");
    final result = await StudyApi.updateInBody(studyId, dto);

    result.when((e) => (apiError.value = e),
        (response) => (updateInBodySuccess.value = response));
  }

  // delete InBody
  RxBool deleteInBodySuccess = false.obs;

  deleteInBody(int studyId) async {
    final result = await StudyApi.deleteInBody(studyId);

    result.when((e) => (apiError.value = e),
        (response) => (deleteInBodySuccess.value = response));
  }

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(fetchMemberStudiesResponse, (_) {
      _setInBodyModels();
      loadingMsg.value = null;
    });
    ever(uploadTodayInBodySuccess, (_) {
      fetchMemberStudies(memberId);
      loadingMsg.value = null;
    });
    ever(updateInBodySuccess, (_) {
      fetchMemberStudies(memberId);
      loadingMsg.value = null;
    });
    ever(deleteInBodySuccess, (_) {
      fetchMemberStudies(memberId);
    });
    ever(apiError, (_) {
      loadingMsg.value = null;
    });
  }

  _setInBodyModels() {
    inBodyModels.value = studies
        .where((it) => it.inBody != null)
        .map((it) => InBodyModel(
            studyId: it.id,
            imageUrl: it.inBody?.imageUrl ?? "",
            studyAt: it.startedAt))
        .toList();
  }
}

class _FetchController extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  // fetch studies
  final Rxn<GetMemberStudiesResponse> fetchMemberStudiesResponse = Rxn();

  List<Items> get studies => fetchMemberStudiesResponse.value?.data.items ?? [];

  Future fetchMemberStudies(int memberId) async {
    final userId = await _getUserId();

    final result =
        await StudyApi.getMemberStudies(trainerId: userId, memberId: memberId);

    result.when((e) => (apiError.value = e),
        (response) => (fetchMemberStudiesResponse.value = response));
  }

  _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(SharedPrefsKeys.id.key) ?? 0;
  }
}
