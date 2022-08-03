class VehicleSignal {
  VehicleSignal({
    required this.speed,
    required this.rpm,
    required this.fuelLevel,
    required this.frontLeftTP,
    required this.frontRightTP,
    required this.rearLeftTP,
    required this.rearRightTP,
    required this.isBatteryCharging,
    required this.isChildLockActiveLeft,
    required this.isChildLockActiveRight,
    required this.currentLatitude,
    required this.currentLongitude,
    required this.fuelRate,
  });

  final double speed;
  final double rpm;
  final double fuelLevel;
  final double frontLeftTP;
  final double frontRightTP;
  final double rearLeftTP;
  final double rearRightTP;
  final bool isChildLockActiveLeft;
  final bool isChildLockActiveRight;
  final double currentLongitude;
  final double currentLatitude;
  final double fuelRate;

  final bool isBatteryCharging;

  VehicleSignal copyWith({
    double? speed,
    double? rpm,
    double? fuelLevel,
    double? frontLeftTP,
    double? frontRightTP,
    double? rearLeftTP,
    double? rearRightTP,
    bool? isBatteryCharging,
    bool? isChildLockActiveLeft,
    bool? isChildLockActiveRight,
    double? currentLongitude,
    double? currentLatitude,
    double? fuelRate,
  }) {
    return VehicleSignal(
      speed: speed ?? this.speed,
      rpm: rpm ?? this.rpm,
      fuelLevel: fuelLevel ?? this.fuelLevel,
      frontLeftTP: frontLeftTP ?? this.frontLeftTP,
      frontRightTP: frontRightTP ?? this.frontRightTP,
      rearLeftTP: rearLeftTP ?? this.rearLeftTP,
      rearRightTP: rearRightTP ?? this.rearRightTP,
      isChildLockActiveLeft:
          isChildLockActiveLeft ?? this.isChildLockActiveLeft,
      isChildLockActiveRight:
          isChildLockActiveRight ?? this.isChildLockActiveRight,
      isBatteryCharging: isBatteryCharging ?? this.isBatteryCharging,
      currentLatitude: currentLatitude ?? this.currentLatitude,
      currentLongitude: currentLongitude ?? this.currentLongitude,
      fuelRate: fuelRate ?? this.fuelRate,
    );
  }
}
