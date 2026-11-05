// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rnn_yaatra/constants/colors.dart';
import 'package:rnn_yaatra/models/account_models/send_message_response_model.dart';
import 'package:rnn_yaatra/services/account_services.dart';
import 'package:rnn_yaatra/utils/spacings.dart';
import 'package:rnn_yaatra/utils/txt_styles.dart';
import 'package:rnn_yaatra/widgets/app_bar.dart'; 
import 'package:rnn_yaatra/widgets/shimmer.dart';



class RaiseTicketDetailScreen extends ConsumerStatefulWidget {
  const RaiseTicketDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RaiseTicketDetailScreenState();
}

class _RaiseTicketDetailScreenState extends ConsumerState<RaiseTicketDetailScreen> {
  final AccountServices _accountServices = AccountServices();
  final TextEditingController _searchController = TextEditingController();

  bool _isLoading = false;
  List<SendMessageData> _messageList = [];
  List<SendMessageData> _filteredList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchSendMessageList();
    });
  }

  Future<void> _fetchSendMessageList() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final res = await _accountServices.getSendMessageList();
      if (mounted) {
        setState(() {
          _messageList = res.data ?? [];
          _filteredList = _messageList;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _messageList = [];
          _filteredList = [];
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _filterData(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        _filteredList = _messageList;
      } else {
        final q = query.toLowerCase();
        _filteredList = _messageList.where((item) {
          final subject = (item.msgSubject ?? "").toLowerCase();
          final message = (item.message ?? "").toLowerCase();
          final createdBy = (item.createdBy ?? "").toLowerCase();
          final toUser = (item.toUserName ?? item.toUserId ?? "").toLowerCase();
          return subject.contains(q) ||
              message.contains(q) ||
              createdBy.contains(q) ||
              toUser.contains(q);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Raise Ticket Detail",
        onBackPressed: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        onRefresh: _fetchSendMessageList,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddVerticalSpacing(5.0),

              // Search Bar
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterData,
                  style: const TextStyle(fontSize: 13),
                  decoration: InputDecoration(
                    hintText: 'Search Subject, Message, or Date...',
                    hintStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 13),
                    prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF0D47A1)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    filled: true,
                    fillColor: const Color(0xFFF8F9FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              AddVerticalSpacing(15.0),
              
              _isLoading
                  ? list_shimmer()
                  : _filteredList.isEmpty
                      ? _buildEmptyState()
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _filteredList.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final item = _filteredList[index];
                            return _buildTicketCard(item);
                          },
                        ),

              AddVerticalSpacing(40.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTicketCard(SendMessageData item) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Ticket ID & Recipient
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D47A1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "Ticket #${item.id ?? ''}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FE),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    const Icon(Iconsax.user_tag, size: 12, color: Color(0xFF1967D2)),
                    const SizedBox(width: 4),
                    Text(
                      "To: ${item.toUserName ?? item.toUserId ?? 'Admin'}",
                      style: const TextStyle(
                        color: Color(0xFF1967D2),
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(height: 1, color: Color(0xFFF1F3F4)),
          ),

          // Subject
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Iconsax.document_text5, size: 16, color: Color(0xFF0D47A1)),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  item.msgSubject ?? 'No Subject',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202124),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Message Content
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              item.message?.trim() ?? '',
              style: TextStyle(
                fontSize: 12,
                color: AppColor.TEXT_DARK,
                height: 1.4,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Date Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time, size: 13, color: AppColor.TEXT_GREY),
                  const SizedBox(width: 4),
                  Text(
                    item.createdBy ?? '',
                    style: StyleHelper.popinsStyle(
                      fontSize: 11.0,
                      color: AppColor.TEXT_GREY,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      child: Column(
        children: [
          const Icon(Iconsax.ticket_expired, size: 50, color: Color(0xFFBDBDBD)),
          const SizedBox(height: 10),
          Text(
            'No raised tickets found',
            style: StyleHelper.popinsStyle(
              fontSize: 14.0,
              color: const Color(0xFF757575),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget list_shimmer() {
    return ListView.separated(
      itemCount: 8,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE0E0E0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Ticket ID & Recipient
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shimmer_container(
                    height: 20.0,
                    width: 40.0,
                    border_radius: 6.0
                  ),
                  shimmer_container(
                    height: 20.0,
                    width: 40.0,
                    border_radius: 6.0
                  ),
                ],
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(height: 1, color: Color(0xFFF1F3F4)),
              ),

              // Subject
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Iconsax.document_text5, size: 16, color: Color(0xFF0D47A1)),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        shimmer_container(
                          height: 6.0,
                          width: 40.0,
                          border_radius: 6.0
                        ),
                        AddVerticalSpacing(5.0),
                        shimmer_container(
                          height: 6.0,
                          width: 80.0,
                          border_radius: 6.0
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Message Content
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: shimmer_container(
                  height: 6.0,
                  width: 80.0,
                  border_radius: 6.0
                ),
              ),
              const SizedBox(height: 10),

              // Date Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 13, color: AppColor.TEXT_GREY),
                      const SizedBox(width: 4),
                      shimmer_container(
                        height: 6.0,
                        width: 40.0,
                        border_radius: 6.0
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}
