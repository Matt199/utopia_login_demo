import 'package:demo_app/app/state/setup/setup_state.dart';
import 'package:demo_app/common/constants/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:utopia_hooks/utopia_hooks.dart';

class SetupStateProvider extends HookStateProviderWidget<SetupState> {
  @override
  SetupState use() {
    final isInitializedValue = useState<bool>(false);
    final context = useContext();

    useSimpleEffect(() async {
      await Future.wait([_precacheImages(context), _setupFirebase()]);
      isInitializedValue.value = true;
    }, []);

    return SetupState(isInitialized: isInitializedValue.value);
  }

  Future<void> _precacheImages(BuildContext context) async {
    await Future.wait(AppImages.precached
        .map((image) => precacheImage(AssetImage(image), context)));
  }

  Future<void> _setupFirebase() async {
    // TODO uncomment after firebase setup
    //await Firebase.initializeApp();
    //await UtopiaFirebaseCrashlytics.setup();
  }
}
