//measurement
class Measurement {
  final int? id;
  final String? url;
  final String? gender;
  final int? height;
  final DateTime? created;
  final int? weight;
  final PhonePosition? phonePosition;
  final dynamic photoFlow;
  final String? ipAddress;
  final String? countryName;
  final String? countryCode;
  final TaskSet? taskSet;
  final VolumeParams? volumeParams;
  final SideParams? sideParams;
  final FrontParams? frontParams;
  final bool? isViewed;
  final bool? isArchived;

  Measurement({
    this.id,
    this.url,
    this.gender,
    this.height,
    this.created,
    this.weight,
    this.phonePosition,
    this.photoFlow,
    this.ipAddress,
    this.countryName,
    this.countryCode,
    this.taskSet,
    this.volumeParams,
    this.sideParams,
    this.frontParams,
    this.isViewed,
    this.isArchived,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
        id: json["id"],
        url: json["url"],
        gender: json["gender"],
        height: json["height"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        weight: json["weight"],
        phonePosition: json["phone_position"] == null
            ? null
            : PhonePosition.fromJson(json["phone_position"]),
        photoFlow: json["photo_flow"],
        ipAddress: json["ip_address"],
        countryName: json["country_name"],
        countryCode: json["country_code"],
        taskSet: json["task_set"] == null
            ? null
            : TaskSet.fromJson(json["task_set"]),
        volumeParams: json["volume_params"] == null
            ? null
            : VolumeParams.fromJson(json["volume_params"]),
        sideParams: json["side_params"] == null
            ? null
            : SideParams.fromJson(json["side_params"]),
        frontParams: json["front_params"] == null
            ? null
            : FrontParams.fromJson(json["front_params"]),
        isViewed: json["is_viewed"],
        isArchived: json["is_archived"],
      );
}

class FrontParams {
  final SoftValidation? softValidation;
  final FrontParamsClothesType? clothesType;
  final double? bodyAreaPercentage;
  final double? bodyHeight;
  final double? outseam;
  final double? outseamFromUpperHipLevel;
  final double? inseam;
  final double? insideLegLengthToThe1InchAboveTheFloor;
  final double? insideCrotchLengthToMidThigh;
  final double? insideCrotchLengthToKnee;
  final double? insideCrotchLengthToCalf;
  final double? crotchLength;
  final double? sleeveLength;
  final double? underarmLength;
  final double? backNeckPointToWristLength;
  final double? backNeckPointToWristLength15Inch;
  final double? highHips;
  final double? shoulders;
  final double? chestTop;
  final double? shoulderLength;
  final double? shoulderSlope;
  final double? neck;
  final double? waistToLowHips;
  final double? waistToUpperKneeLength;
  final double? waistToKnees;
  final double? abdomenToUpperKneeLength;
  final double? upperKneeToAnkle;
  final double? napeToWaistCentreBack;
  final double? shoulderToWaist;
  final double? sideNeckPointToArmpit;
  final double? backNeckHeight;
  final double? bustHeight;
  final double? hipHeight;
  final double? upperHipHeight;
  final double? kneeHeight;
  final double? outerAnkleHeight;
  final double? waistHeight;
  final double? insideLegHeight;
  final double? acrossBackShoulderWidth;
  final double? acrossBackWidth;
  final double? totalCrotchLength;
  final double? waist;
  final double? neckLength;
  final double? upperArmLength;
  final double? lowerArmLength;
  final double? upperHipToHipLength;
  final double? backShoulderWidth;
  final double? rise;
  final double? backNeckToHipLength;
  final double? torsoHeight;
  final double? frontTorsoHeight;
  final double? frontCrotchLength;
  final double? backCrotchLength;
  final double? legsDistance;
  final double? neckToWaistCenterFront;
  final double? inseamFromCrotchToAnkle;
  final double? inseamFromCrotchToFloor;
  final double? newJacketLength;
  final double? sideNeckPointToThigh;

  FrontParams({
    this.softValidation,
    this.clothesType,
    this.bodyAreaPercentage,
    this.bodyHeight,
    this.outseam,
    this.outseamFromUpperHipLevel,
    this.inseam,
    this.insideLegLengthToThe1InchAboveTheFloor,
    this.insideCrotchLengthToMidThigh,
    this.insideCrotchLengthToKnee,
    this.insideCrotchLengthToCalf,
    this.crotchLength,
    this.sleeveLength,
    this.underarmLength,
    this.backNeckPointToWristLength,
    this.backNeckPointToWristLength15Inch,
    this.highHips,
    this.shoulders,
    this.chestTop,
    this.shoulderLength,
    this.shoulderSlope,
    this.neck,
    this.waistToLowHips,
    this.waistToUpperKneeLength,
    this.waistToKnees,
    this.abdomenToUpperKneeLength,
    this.upperKneeToAnkle,
    this.napeToWaistCentreBack,
    this.shoulderToWaist,
    this.sideNeckPointToArmpit,
    this.backNeckHeight,
    this.bustHeight,
    this.hipHeight,
    this.upperHipHeight,
    this.kneeHeight,
    this.outerAnkleHeight,
    this.waistHeight,
    this.insideLegHeight,
    this.acrossBackShoulderWidth,
    this.acrossBackWidth,
    this.totalCrotchLength,
    this.waist,
    this.neckLength,
    this.upperArmLength,
    this.lowerArmLength,
    this.upperHipToHipLength,
    this.backShoulderWidth,
    this.rise,
    this.backNeckToHipLength,
    this.torsoHeight,
    this.frontTorsoHeight,
    this.frontCrotchLength,
    this.backCrotchLength,
    this.legsDistance,
    this.neckToWaistCenterFront,
    this.inseamFromCrotchToAnkle,
    this.inseamFromCrotchToFloor,
    this.newJacketLength,
    this.sideNeckPointToThigh,
  });

  factory FrontParams.fromJson(Map<String, dynamic> json) => FrontParams(
        softValidation: json["soft_validation"] == null
            ? null
            : SoftValidation.fromJson(json["soft_validation"]),
        clothesType: json["clothes_type"] == null
            ? null
            : FrontParamsClothesType.fromJson(json["clothes_type"]),
        bodyAreaPercentage: json["body_area_percentage"]?.toDouble(),
        bodyHeight: json["body_height"]?.toDouble(),
        outseam: json["outseam"]?.toDouble(),
        outseamFromUpperHipLevel:
            json["outseam_from_upper_hip_level"]?.toDouble(),
        inseam: json["inseam"]?.toDouble(),
        insideLegLengthToThe1InchAboveTheFloor:
            json["inside_leg_length_to_the_1_inch_above_the_floor"]?.toDouble(),
        insideCrotchLengthToMidThigh:
            json["inside_crotch_length_to_mid_thigh"]?.toDouble(),
        insideCrotchLengthToKnee:
            json["inside_crotch_length_to_knee"]?.toDouble(),
        insideCrotchLengthToCalf:
            json["inside_crotch_length_to_calf"]?.toDouble(),
        crotchLength: json["crotch_length"]?.toDouble(),
        sleeveLength: json["sleeve_length"]?.toDouble(),
        underarmLength: json["underarm_length"]?.toDouble(),
        backNeckPointToWristLength:
            json["back_neck_point_to_wrist_length"]?.toDouble(),
        backNeckPointToWristLength15Inch:
            json["back_neck_point_to_wrist_length_1_5_inch"]?.toDouble(),
        highHips: json["high_hips"]?.toDouble(),
        shoulders: json["shoulders"]?.toDouble(),
        chestTop: json["chest_top"]?.toDouble(),
        shoulderLength: json["shoulder_length"]?.toDouble(),
        shoulderSlope: json["shoulder_slope"]?.toDouble(),
        neck: json["neck"]?.toDouble(),
        waistToLowHips: json["waist_to_low_hips"]?.toDouble(),
        waistToUpperKneeLength: json["waist_to_upper_knee_length"]?.toDouble(),
        waistToKnees: json["waist_to_knees"]?.toDouble(),
        abdomenToUpperKneeLength:
            json["abdomen_to_upper_knee_length"]?.toDouble(),
        upperKneeToAnkle: json["upper_knee_to_ankle"]?.toDouble(),
        napeToWaistCentreBack: json["nape_to_waist_centre_back"]?.toDouble(),
        shoulderToWaist: json["shoulder_to_waist"]?.toDouble(),
        sideNeckPointToArmpit: json["side_neck_point_to_armpit"]?.toDouble(),
        backNeckHeight: json["back_neck_height"]?.toDouble(),
        bustHeight: json["bust_height"]?.toDouble(),
        hipHeight: json["hip_height"]?.toDouble(),
        upperHipHeight: json["upper_hip_height"]?.toDouble(),
        kneeHeight: json["knee_height"]?.toDouble(),
        outerAnkleHeight: json["outer_ankle_height"]?.toDouble(),
        waistHeight: json["waist_height"]?.toDouble(),
        insideLegHeight: json["inside_leg_height"]?.toDouble(),
        acrossBackShoulderWidth: json["across_back_shoulder_width"]?.toDouble(),
        acrossBackWidth: json["across_back_width"]?.toDouble(),
        totalCrotchLength: json["total_crotch_length"]?.toDouble(),
        waist: json["waist"]?.toDouble(),
        neckLength: json["neck_length"]?.toDouble(),
        upperArmLength: json["upper_arm_length"]?.toDouble(),
        lowerArmLength: json["lower_arm_length"]?.toDouble(),
        upperHipToHipLength: json["upper_hip_to_hip_length"]?.toDouble(),
        backShoulderWidth: json["back_shoulder_width"]?.toDouble(),
        rise: json["rise"]?.toDouble(),
        backNeckToHipLength: json["back_neck_to_hip_length"]?.toDouble(),
        torsoHeight: json["torso_height"]?.toDouble(),
        frontTorsoHeight: json["front_torso_height"]?.toDouble(),
        frontCrotchLength: json["front_crotch_length"]?.toDouble(),
        backCrotchLength: json["back_crotch_length"]?.toDouble(),
        legsDistance: json["legs_distance"]?.toDouble(),
        neckToWaistCenterFront: json["neck_to_waist_center_front"]?.toDouble(),
        inseamFromCrotchToAnkle:
            json["inseam_from_crotch_to_ankle"]?.toDouble(),
        inseamFromCrotchToFloor:
            json["inseam_from_crotch_to_floor"]?.toDouble(),
        newJacketLength: json["new_jacket_length"]?.toDouble(),
        sideNeckPointToThigh: json["side_neck_point_to_thigh"]?.toDouble(),
      );
}

class FrontParamsClothesType {
  final Types? types;

  FrontParamsClothesType({
    this.types,
  });

  factory FrontParamsClothesType.fromJson(Map<String, dynamic> json) =>
      FrontParamsClothesType(
        types: json["types"] == null ? null : Types.fromJson(json["types"]),
      );
}

class Types {
  final Bottom? top;
  final Bottom? bottom;

  Types({
    this.top,
    this.bottom,
  });

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        top: json["top"] == null ? null : Bottom.fromJson(json["top"]),
        bottom: json["bottom"] == null ? null : Bottom.fromJson(json["bottom"]),
      );
}

class Bottom {
  final String? code;
  final String? detail;

  Bottom({
    this.code,
    this.detail,
  });

  factory Bottom.fromJson(Map<String, dynamic> json) => Bottom(
        code: json["code"],
        detail: json["detail"],
      );
}

class SoftValidation {
  final List<dynamic>? messages;

  SoftValidation({
    this.messages,
  });

  factory SoftValidation.fromJson(Map<String, dynamic> json) => SoftValidation(
        messages: json["messages"] == null
            ? []
            : List<dynamic>.from(json["messages"]!.map((x) => x)),
      );
}

class PhonePosition {
  PhonePosition();

  factory PhonePosition.fromJson(Map<String, dynamic> json) => PhonePosition();
}

class SideParams {
  final SoftValidation? softValidation;
  final SideParamsClothesType? clothesType;
  final double? bodyAreaPercentage;
  final double? sideUpperHipLevelToKnee;
  final double? sideNeckPointToUpperHip;
  final double? neckToChest;
  final double? chestToWaist;
  final double? waistToAnkle;
  final double? shouldersToKnees;
  final double? waistDepth;
  final double? axillaToWaistSideLength;
  final double? neckSideToWaistBackLength;

  SideParams({
    this.softValidation,
    this.clothesType,
    this.bodyAreaPercentage,
    this.sideUpperHipLevelToKnee,
    this.sideNeckPointToUpperHip,
    this.neckToChest,
    this.chestToWaist,
    this.waistToAnkle,
    this.shouldersToKnees,
    this.waistDepth,
    this.axillaToWaistSideLength,
    this.neckSideToWaistBackLength,
  });

  factory SideParams.fromJson(Map<String, dynamic> json) => SideParams(
        softValidation: json["soft_validation"] == null
            ? null
            : SoftValidation.fromJson(json["soft_validation"]),
        clothesType: json["clothes_type"] == null
            ? null
            : SideParamsClothesType.fromJson(json["clothes_type"]),
        bodyAreaPercentage: json["body_area_percentage"]?.toDouble(),
        sideUpperHipLevelToKnee:
            json["side_upper_hip_level_to_knee"]?.toDouble(),
        sideNeckPointToUpperHip:
            json["side_neck_point_to_upper_hip"]?.toDouble(),
        neckToChest: json["neck_to_chest"]?.toDouble(),
        chestToWaist: json["chest_to_waist"]?.toDouble(),
        waistToAnkle: json["waist_to_ankle"]?.toDouble(),
        shouldersToKnees: json["shoulders_to_knees"]?.toDouble(),
        waistDepth: json["waist_depth"]?.toDouble(),
        axillaToWaistSideLength:
            json["axilla_to_waist_side_length"]?.toDouble(),
        neckSideToWaistBackLength:
            json["neck_side_to_waist_back_length"]?.toDouble(),
      );
}

class SideParamsClothesType {
  final List<dynamic>? types;

  SideParamsClothesType({
    this.types,
  });

  factory SideParamsClothesType.fromJson(Map<String, dynamic> json) =>
      SideParamsClothesType(
        types: json["types"] == null
            ? []
            : List<dynamic>.from(json["types"]!.map((x) => x)),
      );
}

class TaskSet {
  final bool? isSuccessful;
  final bool? isReady;
  final List<SubTask>? subTasks;

  TaskSet({
    this.isSuccessful,
    this.isReady,
    this.subTasks,
  });

  factory TaskSet.fromJson(Map<String, dynamic> json) => TaskSet(
        isSuccessful: json["is_successful"],
        isReady: json["is_ready"],
        subTasks: json["sub_tasks"] == null
            ? []
            : List<SubTask>.from(
                json["sub_tasks"]!.map((x) => SubTask.fromJson(x))),
      );
}

class SubTask {
  final String? name;
  final String? status;
  final String? taskId;
  final String? message;

  SubTask({
    this.name,
    this.status,
    this.taskId,
    this.message,
  });

  factory SubTask.fromJson(Map<String, dynamic> json) => SubTask(
        name: json["name"],
        status: json["status"],
        taskId: json["task_id"],
        message: json["message"],
      );
}

class VolumeParams {
  final double? chest;
  final double? underBustGirth;
  final double? upperChestGirth;
  final double? overarmGirth;
  final double? waist;
  final double? alternativeWaistGirth;
  final double? highHips;
  final double? lowHips;
  final double? waistGreen;
  final double? waistGray;
  final double? pantWaist;
  final double? bicep;
  final double? upperBicepGirth;
  final double? upperKneeGirth;
  final double? knee;
  final double? ankle;
  final double? wrist;
  final double? calf;
  final double? thigh;
  final double? thigh1InchBelowCrotch;
  final double? midThighGirth;
  final double? neck;
  final double? abdomen;
  final double? armscyeGirth;
  final double? neckGirth;
  final double? neckGirthRelaxed;
  final double? forearm;
  final double? elbowGirth;
  final String? bodyType;
  final String? bodyModel;
  final dynamic postFittingModel;
  final String? postFittingModelStatus;
  final dynamic textures;
  final dynamic coatSleeveInseam;
  final dynamic frontDebugInfo;
  final dynamic volumeDebugInfo;

  VolumeParams({
    this.chest,
    this.underBustGirth,
    this.upperChestGirth,
    this.overarmGirth,
    this.waist,
    this.alternativeWaistGirth,
    this.highHips,
    this.lowHips,
    this.waistGreen,
    this.waistGray,
    this.pantWaist,
    this.bicep,
    this.upperBicepGirth,
    this.upperKneeGirth,
    this.knee,
    this.ankle,
    this.wrist,
    this.calf,
    this.thigh,
    this.thigh1InchBelowCrotch,
    this.midThighGirth,
    this.neck,
    this.abdomen,
    this.armscyeGirth,
    this.neckGirth,
    this.neckGirthRelaxed,
    this.forearm,
    this.elbowGirth,
    this.bodyType,
    this.bodyModel,
    this.postFittingModel,
    this.postFittingModelStatus,
    this.textures,
    this.coatSleeveInseam,
    this.frontDebugInfo,
    this.volumeDebugInfo,
  });

  factory VolumeParams.fromJson(Map<String, dynamic> json) => VolumeParams(
        chest: json["chest"]?.toDouble(),
        underBustGirth: json["under_bust_girth"]?.toDouble(),
        upperChestGirth: json["upper_chest_girth"]?.toDouble(),
        overarmGirth: json["overarm_girth"]?.toDouble(),
        waist: json["waist"]?.toDouble(),
        alternativeWaistGirth: json["alternative_waist_girth"]?.toDouble(),
        highHips: json["high_hips"]?.toDouble(),
        lowHips: json["low_hips"]?.toDouble(),
        waistGreen: json["waist_green"]?.toDouble(),
        waistGray: json["waist_gray"]?.toDouble(),
        pantWaist: json["pant_waist"]?.toDouble(),
        bicep: json["bicep"]?.toDouble(),
        upperBicepGirth: json["upper_bicep_girth"]?.toDouble(),
        upperKneeGirth: json["upper_knee_girth"]?.toDouble(),
        knee: json["knee"]?.toDouble(),
        ankle: json["ankle"]?.toDouble(),
        wrist: json["wrist"]?.toDouble(),
        calf: json["calf"]?.toDouble(),
        thigh: json["thigh"]?.toDouble(),
        thigh1InchBelowCrotch: json["thigh_1_inch_below_crotch"]?.toDouble(),
        midThighGirth: json["mid_thigh_girth"]?.toDouble(),
        neck: json["neck"]?.toDouble(),
        abdomen: json["abdomen"]?.toDouble(),
        armscyeGirth: json["armscye_girth"]?.toDouble(),
        neckGirth: json["neck_girth"]?.toDouble(),
        neckGirthRelaxed: json["neck_girth_relaxed"]?.toDouble(),
        forearm: json["forearm"]?.toDouble(),
        elbowGirth: json["elbow_girth"]?.toDouble(),
        bodyType: json["body_type"],
        bodyModel: json["body_model"],
        postFittingModel: json["post_fitting_model"],
        postFittingModelStatus: json["post_fitting_model_status"],
        textures: json["textures"],
        coatSleeveInseam: json["coat_sleeve_inseam"],
        frontDebugInfo: json["front_debug_info"],
        volumeDebugInfo: json["volume_debug_info"],
      );
}
