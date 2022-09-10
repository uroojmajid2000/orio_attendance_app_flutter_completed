part of '../otp_screen.dart';

class Body extends HookWidget {
  Body({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _digit1Controller = TextEditingController();
  final _digit2Controller = TextEditingController();
  final _digit3Controller = TextEditingController();
  final _digit4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String phone = context.read<UserCubit>().state.user.phone;
    final isMounted = useIsMounted();

    void fetchStations() async {
      String token = context.read<UserCubit>().state.user.token;
      await context.read<StationCubit>().get(token);
    }

    String comingSms = 'Unknown';

    Future<void> initSmsListener() async {
      String comingSms;
      try {
        comingSms = await AltSmsAutofill().listenForSms ?? '';
      } on PlatformException {
        comingSms = 'Failed to get Sms.';
      }
      if (!isMounted()) return;

      comingSms = comingSms;
      print("====>Message: $comingSms");

      _digit1Controller.text = comingSms[0];
      _digit2Controller.text = comingSms[1];
      _digit3Controller.text = comingSms[2];
      _digit4Controller.text = comingSms[3];
    }

    useEffect(() {
      fetchStations();
      initSmsListener();
      return () => AltSmsAutofill().unregisterListener();
    }, []);

    void onSuccess() => Navigate.next(context, HomeScreen.id);

    void onSubmit(VoidCallback onSuccess) async {
      final form = _formKey.currentState;
      if (form!.validate()) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (_digit1Controller.text != '' ||
            _digit2Controller.text != '' ||
            _digit3Controller.text != '' ||
            _digit4Controller.text != '') {
          String otp =
              '${_digit1Controller.text}${_digit2Controller.text}${_digit3Controller.text}${_digit4Controller.text}';
          if (otp == BlocProvider.of<UserCubit>(context).state.user.otp) {
            context.read<UserCubit>().verifyOtp();
            onSuccess.call();
          } else {
            _digit1Controller.clear();
            _digit2Controller.clear();
            _digit3Controller.clear();
            _digit4Controller.clear();

            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const Alert(
                  heading: 'Error!',
                  body: 'OTP is incorrect',
                );
              },
            );
          }
          form.save();
        }
      } else {}
    }

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.1),
            height: size.height * 0.8,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SvgPicture.asset('assets/icons/otp.svg'),
                  const SizedBox(height: 25),
                  MyText.body('Code is sent to $phone'),
                  const SizedBox(height: 44),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFieldBox(
                        controller: _digit1Controller,
                        autofocus: true,
                        onChange: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      TextFieldBox(
                        controller: _digit2Controller,
                        onChange: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      TextFieldBox(
                        controller: _digit3Controller,
                        onChange: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      TextFieldBox(
                        controller: _digit4Controller,
                        onChange: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                            onSubmit(onSuccess);
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                    child: Button(
                      child: const Text('Verify'),
                      onPressed: () => onSubmit(onSuccess),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
