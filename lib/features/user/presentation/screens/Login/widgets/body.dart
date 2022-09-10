part of '../login_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _idController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onSuccess() => Navigate.to(context, OtpScreen.id);

  void _onSubmit(VoidCallback onSuccess) async {
    final form = _formKey.currentState;
    UserStatus status = context.read<UserCubit>().state.status;

    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      if (_idController.text != '') {
        await context.read<UserCubit>().login(_idController.text);
        if (status == UserStatus.error) {
          _idController.clear();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Alert(
                heading: 'Login Failed!',
                body: 'Employee ID is incorrect',
              );
            },
          );
        } else {
          onSuccess.call();
        }
        form.save();
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Login Now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please enter the details below to continue.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 44),
            TextFieldContainer(
              child: TransparentTextField(
                controller: _idController,
                hintText: 'Employee ID',
                keyboardType: TextInputType.number,
                onChange: (value) {},
              ),
            ),
            const SizedBox(height: 20),
            Button(
              child:
                  context.watch<UserCubit>().state.status == UserStatus.loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Login', style: TextStyle(fontSize: 18)),
              onPressed: () => _onSubmit(_onSuccess),
            ),
          ],
        ),
      ),
    );
  }
}
