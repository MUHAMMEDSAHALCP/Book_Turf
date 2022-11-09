import 'package:book_turf/app/components/snackbar.dart';
import 'package:book_turf/app/modules/bottom_navigation/view/bottom_nav_bar.dart';
import 'package:book_turf/app/modules/bottom_navigation/view_model/bottom_nav_provider.dart';
import 'package:book_turf/app/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckOutViewModel extends ChangeNotifier {
  CheckOutViewModel() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  final razorpay = Razorpay();
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Navigations.push(const BottomNavView());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  void disposeData() {
    razorpay.clear();
  }

  razorPay() {
    var options = {
      'key': 'rzp_test_GdZekBEhz8b5fZ',
      'amount': 10000,
      'name': 'BookTurf',
      'description': "sahal",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '234254234',
        'email': 'ldkfsakldfj@gamil.com',
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  String _type = "Advanced Payment";
  get type => _type;
  setState(value) {
    _type = value;
    notifyListeners();
  }

  bool isMorTure = false;
  bool isAftTure = false;
  bool isEveTure = false;
  List morningSelectedTimeSlot = [];
  List afternoonSelectedTimeSlot = [];
  List eveningSelectedTimeSlot = [];
  showSelectedTimeSlot(List selectedTimeSlot) {
    isMorTure = false;
    isAftTure = false;
    isEveTure = false;
    morningSelectedTimeSlot.clear();
    afternoonSelectedTimeSlot.clear();
    eveningSelectedTimeSlot.clear();
    for (int i = 0; i < selectedTimeSlot.length; i++) {
      if (selectedTimeSlot[i] < 12) {
        isMorTure = true;
        int start = selectedTimeSlot[i];
        int end = start + 1;
        String time = "$start:00 - $end:00";

        morningSelectedTimeSlot.add(time);
        notifyListeners();
      } else if (selectedTimeSlot[i] >= 12 && selectedTimeSlot[i] < 17) {
        isAftTure = true;

        int start = selectedTimeSlot[i] - 12;
        int end = start + 1;
        String time = " $start:00 - $end:00";
        afternoonSelectedTimeSlot.add(time);
        notifyListeners();
      } else if (selectedTimeSlot[i] >= 17 && selectedTimeSlot[i] < 24) {
        isEveTure = true;

        int start = selectedTimeSlot[i] - 12;
        int end = start + 1;
        String time = " $start:00 - $end:00";
        eveningSelectedTimeSlot.add(time);
        notifyListeners();
      }
    }
  }
}
