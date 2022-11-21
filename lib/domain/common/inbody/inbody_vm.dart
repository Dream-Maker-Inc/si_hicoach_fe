import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/file_picker/file_picker_extension.dart';
import 'package:si_hicoach_fe/domain/common/inbody/models/inbody_model.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/dto/create_today_inBody_dto.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/dto/get_inbodies_response.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/dto/update_inBody_dto.dart';
import 'package:si_hicoach_fe/infrastructure/inbody/inbody_api.dart';

class InBodyViewModel extends _FetchController {
  int memberId = 0;
  int matchingId = 0;

  RxList<InBodyModel> inBodyModels = RxList();
  RxnString loadingMsg = RxnString(null);

  // upload InBody
  RxBool createTodayInBodySuccess = false.obs;

  createTodayInBody(FilePickerResult filePickerResult) async {
    final multipartFiles = await Future.wait(
        filePickerResult.files.map((it) => it.toMultipartFile));

    final dto = CreateTodayInBodyDto(memberId: memberId, files: multipartFiles);

    loadingMsg("파일 업로드 중 입니다.");
    final result = await InBodyApi.createTodayInBody(dto);

    result.when((e) => (apiError.value = e),
        (response) => (createTodayInBodySuccess.value = response));
  }

  // update InBody
  RxBool updateInBodySuccess = false.obs;

  updateInBody(int inbodyId, FilePickerResult filePickerResult) async {
    final multipartFiles = await Future.wait(
        filePickerResult.files.map((it) => it.toMultipartFile));

    final dto = UpdateInBodyDto(multipartFiles);

    loadingMsg("파일 업로드 중 입니다.");
    final result = await InBodyApi.updateInBody(inbodyId, dto);

    result.when((e) => (apiError.value = e),
        (response) => (updateInBodySuccess.value = response));
  }

  // delete InBody
  RxBool deleteInBodySuccess = false.obs;

  deleteInBody(int inbodyId) async {
    final result = await InBodyApi.deleteInBody(inbodyId);

    result.when((e) => (apiError.value = e),
        (response) => (deleteInBodySuccess.value = response));
  }

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(fetchInbodyResponse, (_) {
      _setInBodyModels();
      loadingMsg.value = null;
    });
    ever(createTodayInBodySuccess, (_) {
      fetchMemberInbodies(memberId);
      loadingMsg.value = null;
    });
    ever(updateInBodySuccess, (_) {
      fetchMemberInbodies(memberId);
      loadingMsg.value = null;
    });
    ever(deleteInBodySuccess, (_) {
      fetchMemberInbodies(memberId);
    });
    ever(apiError, (_) {
      loadingMsg.value = null;
    });
  }

  _setInBodyModels() {
    inBodyModels.value = inbodies
        .map((it) => InBodyModel(
            inbodyId: it.id, imageUrl: it.imageUrl, registedAt: it.registDate))
        .toList();
  }
}

class _FetchController extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  // fetch inbodis
  final Rxn<GetInbodiesResponse> fetchInbodyResponse = Rxn();

  List<Items> get inbodies => fetchInbodyResponse.value?.data.items ?? [];

  Future fetchMemberInbodies(int memberId) async {
    final result = await InBodyApi.getInBodies(memberId);

    result.when((e) => (apiError.value = e),
        (response) => (fetchInbodyResponse.value = response));
  }
}
