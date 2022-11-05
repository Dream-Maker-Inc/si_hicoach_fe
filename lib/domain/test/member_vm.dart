import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/test/member_repository.dart';
import 'package:si_hicoach_fe/domain/test/models/member.dart';

class MembersViewModel with ChangeNotifier {
  late final MemberRepository _memberRepository;

  List<Member> get items => _items;
  List<Member> _items = [];

  MembersViewModel() {
    _memberRepository = MemberRepository();
    _loadItems();
  }

  Future<void> _loadItems() async {
    _items = await _memberRepository.find();
    notifyListeners();
  }

  Future<bool> deleteItem(String id) async {
    return await _memberRepository.delete(id);
  }
}
