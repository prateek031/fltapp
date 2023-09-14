class LoggedinUser {
    bool loggedinUserReturn;
    String message;
    Data data;

    LoggedinUser({
        required this.loggedinUserReturn,
        required this.message,
        required this.data,
    });

}

class Data {
    int id;
    String name;
    int mobile;
    dynamic address;
    dynamic dob;
    dynamic gender;
    dynamic address2;
    dynamic email;
    dynamic stateId;
    dynamic city;
    dynamic pinCode;
    dynamic image;
    String time;
    DateTime createdAt;
    DateTime updatedAt;
    String verifiedStatus;
    dynamic identificationNumber;
    dynamic type;
    dynamic gstNumber;
    String craditEnable;
    String apiToken;
    dynamic fcmToken;
    dynamic walletAmount;
    String emailVerify;
    String mobileVerify;
    dynamic multipleAddressPincodeId;
    dynamic identityType;
    dynamic identityNumber;
    dynamic mobile2;
    dynamic stateDetail;
    dynamic citydetails;
    dynamic pincodes;

    Data({
        required this.id,
        required this.name,
        required this.mobile,
        required this.address,
        required this.dob,
        required this.gender,
        required this.address2,
        required this.email,
        required this.stateId,
        required this.city,
        required this.pinCode,
        required this.image,
        required this.time,
        required this.createdAt,
        required this.updatedAt,
        required this.verifiedStatus,
        required this.identificationNumber,
        required this.type,
        required this.gstNumber,
        required this.craditEnable,
        required this.apiToken,
        required this.fcmToken,
        required this.walletAmount,
        required this.emailVerify,
        required this.mobileVerify,
        required this.multipleAddressPincodeId,
        required this.identityType,
        required this.identityNumber,
        required this.mobile2,
        required this.stateDetail,
        required this.citydetails,
        required this.pincodes,
    });

}
