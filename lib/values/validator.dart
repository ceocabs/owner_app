
import 'package:form_field_validator/form_field_validator.dart';

final mobileValidator = MultiValidator([
  RequiredValidator(errorText: kEnterMobileNumber),
  MinLengthValidator(10, errorText: kEnterValidMobileNumber),
]);

final pinCodeValidator = MultiValidator([
  RequiredValidator(errorText: kEnterPinCode),
  MinLengthValidator(6, errorText: kEnterValidPinCode),
]);

final aadtharCardValidator = MultiValidator([
  RequiredValidator(errorText: kEnterAadtharCard),
  MinLengthValidator(12, errorText: kEnterValidAadtharCard),
]);

final panCardValidator = MultiValidator([
  RequiredValidator(errorText: kEnterPanCard),
  MinLengthValidator(10, errorText: kEnterValidPanCard),
]);

final drivingLicenseValidator = MultiValidator([
  RequiredValidator(errorText: kEnterDrivingLicense),
  MinLengthValidator(15, errorText: kEnterValidDrivingLicense),
]);

final drivingLicenseLastDateValidator = MultiValidator([
  RequiredValidator(errorText: kEnterDrivingLicenseDate),
  MinLengthValidator(9, errorText: kEnterValidDrivingLicenseDate),
]);

final cityValidator = MultiValidator([
  RequiredValidator(errorText: kEnterCity),
  MinLengthValidator(3, errorText: kEnterValidCity),
]);

final stateValidator = MultiValidator([
  RequiredValidator(errorText: kEnterState),
  MinLengthValidator(3, errorText: kEnterValidState),
]);

final addressValidator = MultiValidator([
  RequiredValidator(errorText: kEnterAddress),
//  MinLengthValidator(16, errorText: kEnterValidAddress),
]);

final mobileCodeValidator = MultiValidator([
  RequiredValidator(errorText: kEnterCountryCode),
]);
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: kEnterPassword),
  MinLengthValidator(6, errorText: kEnterValidPassword),
]);
final confPasswordValidator = MultiValidator([
  RequiredValidator(errorText: kEnterConfPassword),
  MinLengthValidator(6, errorText: kEnterValidPassword),
]);
final userNameValidator = MultiValidator([
  RequiredValidator(errorText: kEnterUserName),
  MinLengthValidator(3, errorText: kEnterValidUserName),
]);
final nameValidator = MultiValidator([
  RequiredValidator(errorText: kEnterName),
  MinLengthValidator(3, errorText: kEnterName),
]);
final firstNameValidator = MultiValidator([
  RequiredValidator(errorText: kEnterFirstName),
  MinLengthValidator(3, errorText: kEnterValidFirstName),
]);

final subjectValidator = MultiValidator([
  RequiredValidator(errorText: kEnterSubjectName),
  MinLengthValidator(3, errorText: kEnterValidSubjectName),
]);

final descriptionValidator = MultiValidator([
  RequiredValidator(errorText: kEnterDescriptionName),
  MinLengthValidator(3, errorText: kEnterValidDescriptionName),
]);

final lastNameValidator = MultiValidator([
  RequiredValidator(errorText: kEnterLastName),
  MinLengthValidator(3, errorText: kEnterValidLastName),
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: kEnterEmailAddress),
  EmailValidator(errorText: kEnterValidEmailAddress),
]);

final discriptionIssueValidator = MultiValidator([
  RequiredValidator(errorText: kEnterDescription),
]);
/*final commonValidator = MultiValidator([
  LYDPhoneValidator(
    errorText: kEmptyField,
    emailInvalid: kEnterValidEmailAddress,
  ),
]);*/

const kEmptyField = 'Please enter email';

const kEnterCountryCode = 'Please enter country code';

const kEnterMobileNumber = 'Please enter mobile number';
const kEnterValidMobileNumber = 'Please enter valid mobile number';

const kEnterPinCode = 'Please enter pin code';
const kEnterValidPinCode = 'Please enter valid pin code';

const kEnterAadtharCard = 'Please enter Aadhar card number';
const kEnterValidAadtharCard = 'Please enter valid Aadhar number';

const kEnterPanCard = 'Please enter pan card number';
const kEnterValidPanCard = 'Please enter valid pan card number';

const kEnterDrivingLicense = 'Please enter driving license';
const kEnterValidDrivingLicense = 'Please enter valid driving license';

const kEnterDrivingLicenseDate = 'Please enter expiry date';
const kEnterValidDrivingLicenseDate = 'Please enter valid expiry date';

const kEnterValidEmailAddress = 'Please enter valid email';
const kEnterEmailAddress = 'Please enter email';

const kEnterValidAddress = 'Please enter valid address';
const kEnterAddress = 'Please enter address';

const kEnterValidCity = 'Please enter valid city';
const kEnterCity = 'Please enter city';



const kEnterValidState = 'Please enter valid state';
const kEnterState = 'Please enter state';


const kEnterUserName = 'Please enter user name';
const kEnterValidUserName = 'Please enter at least 3 characters for user name';

const kEnterName = 'Please enter name';

const kEnterFirstName = 'Please enter first name';
const kEnterValidFirstName =
    'Please enter at least 3 characters for first name';

const kEnterSubjectName = 'Please enter subject name';
const kEnterValidSubjectName =
    'Please enter at least 3 characters for subject name';

const kEnterDescriptionName = 'Please enter description name';
const kEnterValidDescriptionName =
    'Please enter at least 3 characters for description name';

const kEnterLastName = 'Please enter last name';
const kEnterValidLastName = 'Please enter at least 3 characters for last name';

const kEnterConfPassword = 'Please enter confirm password';
const kEnterPassword = 'Please enter password';
const kEnterValidPassword = 'Password should be 6 or more characters';

const kPleaseEnterOtp = 'Please enter OTP';
const kPleaseEnterValidOtp = 'Please enter valid OTP';

const kConfirm = "Confirm";
const kLogoutMsg = "Are you sure \n\nYou want to logout?";
const kDeleteAccount = "Are you sure \n\nYou want to delete account?";

const kEnterDescription = 'Please enter description';
