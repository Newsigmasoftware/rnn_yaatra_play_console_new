import 'package:rnn_yaatra/models/account_models/get_chain_response_model.dart';

class DepositRequestInterface {

  final int selectedTabIndex;
  final String? selectedReceipt;
  final String paymentMode;
  final List<ChainData>? chainList;
  final ChainData? selectedChain;
  final bool isLoadingChains;

  DepositRequestInterface({
    this.selectedTabIndex = 0,
    this.selectedReceipt,
    this.paymentMode = "1",
    this.chainList,
    this.selectedChain,
    this.isLoadingChains = false,
  });

  DepositRequestInterface copyWith({
    int? tabIndex,
    String? receiptImage,
    String? paymentMode,
    List<ChainData>? chainList,
    ChainData? selectedChain,
    bool? isLoadingChains,
  }) {
    return DepositRequestInterface(
      selectedTabIndex: tabIndex ?? this.selectedTabIndex,
      selectedReceipt: receiptImage ?? this.selectedReceipt,
      paymentMode: paymentMode ?? this.paymentMode,
      chainList: chainList ?? this.chainList,
      selectedChain: selectedChain ?? this.selectedChain,
      isLoadingChains: isLoadingChains ?? this.isLoadingChains,
    );
  }
}
