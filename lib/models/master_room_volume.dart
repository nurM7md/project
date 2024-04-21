class MasterRoomVolume {
  late double _lengthVolume;
  late double _widthVolume;
  late double _heightVolume;
  late double _fullPrice;

  MasterRoomVolume({
    required double lengthVolume,
    required double widthVolume,
    required double heightVolume,
    required double fullPrice,
  }) {
    _lengthVolume = lengthVolume;
    _widthVolume = widthVolume;
    _heightVolume = heightVolume;
    _fullPrice = fullPrice;
  }

  double get fullPrice => _fullPrice;

  set fullPrice(double value) {
    _fullPrice = value;
  }

  double get heightVolume => _heightVolume;

  set heightVolume(double value) {
    _heightVolume = value;
  }

  double get widthVolume => _widthVolume;

  set widthVolume(double value) {
    _widthVolume = value;
  }

  double get lengthVolume => _lengthVolume;

  set lengthVolume(double value) {
    _lengthVolume = value;
  }
}
