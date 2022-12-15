import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/members/dto/get_members_page_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/members/trainer_members_page_api.dart';

class MemberListPopupViewModel extends GetxController {
  // 수강중인 회원 수
  int get totalMemberCount =>
      _getInClassMembersResponse.value?.data.metaData.totalItemCount ?? 0;

  // 멤버 ID로 수강중인 회원 정보 구하기
  Items? findItemByMemberId(int memberId) {
    return inClassMembers.firstWhereOrNull((it) => it.member.id == memberId);
  }

  //
  Rx<Exception?> apiError = Rx(null);

  // fetch in class members
  final Rxn<GetMembersPageResponse> _getInClassMembersResponse = Rxn();

  List<Items> get inClassMembers =>
      _getInClassMembersResponse.value?.data.items ?? [];

  fetchInClassMembers() async {
    final result = await TrainerMembersPageApi.getData();

    result.when((e) => (apiError.value = e),
        (response) => (_getInClassMembersResponse.value = response));
  }
}
