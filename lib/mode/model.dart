class NumberModel{
  String? name;
  dynamic number;


  NumberModel({
    this.name,
    this.number,
  });

  factory NumberModel.fromjson(Map<String ,dynamic> json)=> NumberModel(
    name: json["name"],
    number: json["number"],
  );

  Map< String , dynamic> map()=> {
    "name" : name,
    "number" : number,
  };
}