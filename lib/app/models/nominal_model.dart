class NominalModel {
  final String id;
  final double value;
  final bool isActive;

  NominalModel({
    required this.id,
    required this.value,
    this.isActive = true,
  });
}

List<NominalModel> nominals = [
  NominalModel(
    id: "1",
    value: 2000,
  ),
   NominalModel(
    id: "2",
    value: 5000,
  ),
   NominalModel(
    id: "3",
    value: 10000,
  ),
   NominalModel(
    id: "4",
    value: 20000,
  ),
   NominalModel(
    id: "5",
    value: 50000,
  ),
];
