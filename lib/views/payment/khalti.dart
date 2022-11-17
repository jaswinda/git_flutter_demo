import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_flutter_demo/controllers/order_controller.dart';
import 'package:khalti/khalti.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class KhaltiPayment extends StatelessWidget {
  const KhaltiPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('KPG Example'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Wallet Payment'),
              Tab(text: 'EBanking'),
              Tab(text: 'MBanking'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WalletPayment(),
            Banking(paymentType: PaymentType.eBanking),
            Banking(paymentType: PaymentType.mobileCheckout),
          ],
        ),
      ),
    );
  }
}

class WalletPayment extends StatefulWidget {
  const WalletPayment({Key? key}) : super(key: key);

  @override
  State<WalletPayment> createState() => _WalletPaymentState();
}

class _WalletPaymentState extends State<WalletPayment> {
  late final TextEditingController _mobileController, _pinController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final OrderController orderController = Get.find();

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
    _pinController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            validator: (v) => (v?.isEmpty ?? true) ? 'Required ' : null,
            decoration: const InputDecoration(
              label: Text('Mobile Number'),
            ),
            controller: _mobileController,
          ),
          TextFormField(
            validator: (v) => (v?.isEmpty ?? true) ? 'Required ' : null,
            decoration: const InputDecoration(
              label: Text('Khalti MPIN'),
            ),
            controller: _pinController,
            obscureText: true,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              if (!(_formKey.currentState?.validate() ?? false)) return;

              final initiationModel = await Khalti.service.initiatePayment(
                request: PaymentInitiationRequestModel(
                  amount: 1000,
                  mobile: _mobileController.text,
                  productIdentity: 'mac-mini',
                  productName: 'Apple Mac Mini',
                  transactionPin: _pinController.text,
                  productUrl: 'https://khalti.com/bazaar/mac-mini-16-512-m1',
                  additionalData: {
                    'vendor': 'Oliz Store',
                    'manufacturer': 'Apple Inc.',
                  },
                ),
              );

              final otpCode = await showDialog<String>(
                context: context,
                builder: (context) {
                  String? otp;
                  return AlertDialog(
                    title: const Text('OTP Sent!'),
                    content: TextField(
                      decoration: const InputDecoration(
                        label: Text('OTPotpe'),
                      ),
                      onChanged: (v) => otp = v,
                    ),
                    actions: [
                      SimpleDialogOption(
                        child: const Text('OK'),
                        onPressed: () => Navigator.pop(context, otp),
                      )
                    ],
                  );
                },
              );

              if (otpCode != null) {
                try {
                  final model = await Khalti.service.confirmPayment(
                    request: PaymentConfirmationRequestModel(
                      confirmationCode: otpCode,
                      token: initiationModel.token,
                      transactionPin: _pinController.text,
                    ),
                  );

                  debugPrint(model.toString());
                  var paymentToken = model.token;
                  orderController.order(paymentToken, 10);
                } catch (e) {
                  ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              }
            },
            child: const Text('PAY Rs. 10'),
          ),
        ],
      ),
    );
  }
}

class Banking extends StatefulWidget {
  const Banking({Key? key, required this.paymentType}) : super(key: key);

  final PaymentType paymentType;

  @override
  State<Banking> createState() => _BankingState();
}

class _BankingState extends State<Banking> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FutureBuilder<BankListModel>(
      future: Khalti.service.getBanks(paymentType: widget.paymentType),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final banks = snapshot.data!.banks;
          return ListView.builder(
            itemCount: banks.length,
            itemBuilder: (context, index) {
              final bank = banks[index];

              return ListTile(
                leading: SizedBox.square(
                  dimension: 40,
                  child: Image.network(bank.logo),
                ),
                title: Text(bank.name),
                subtitle: Text(bank.shortName),
                onTap: () async {
                  final mobile = await showDialog<String>(
                    context: context,
                    builder: (context) {
                      String? mobile;
                      return AlertDialog(
                        title: const Text('Enter Mobile Number'),
                        content: TextField(
                          decoration: const InputDecoration(
                            label: Text('Mobmobileber'),
                          ),
                          onChanged: (v) => mobile = v,
                        ),
                        actions: [
                          SimpleDialogOption(
                            child: const Text('OK'),
                            onPressed: () => Navigator.pop(context, mobile),
                          )
                        ],
                      );
                    },
                  );

                  if (mobile != null) {
                    final url = Khalti.service.buildBankUrl(
                      bankId: bank.idx,
                      amount: 1000,
                      mobile: mobile,
                      productIdentity: 'macbook-pro-21',
                      productName: 'Macbook Pro 2021',
                      paymentType: widget.paymentType,
                      returnUrl: 'https://khalti.com',
                    );

                    url_launcher.launch(url);
                  }
                },
              );
            },
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
