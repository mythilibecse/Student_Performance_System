class UserFields{
  static final String name ='name';
  static final String regno ='regno';
  static final String unit1 = 'unit1';
  static final String unit2 ='unit2';
  static final String unit3 ='unit3';
  static final String model1 ='model1';
  static final String model2 ='model2';
  static final String attendance='attendance';
  static final String assignment='assignment';
  static List<String> getFields() => [name,regno,unit1,unit2,unit3,model1,model2,attendance,assignment];

}



class User {
  final String name;
  final String? regno;
  final String unit1;
  final String unit2 ;
  final String unit3 ;
  final String model1 ;
  final String model2 ;
  final String attendance;
  final String assignment;
  const User(  {
    required this.name,
    this.regno,
    required this.unit1,
    required this.unit2,
    required this.unit3,
    required this.model1,
    required this.model2,
    required this.attendance,
    required this.assignment,

  });

  User copy({
    String? regno,
    String? name,
    String? unit1,
    String? unit2,
    String? unit3,
    String? model1,
    String? model2,
    String? attendance,
    String? assignment

  })=>
      User(
          name: name?? this.name,
          regno: regno ?? this.regno,
         unit1: unit1 ?? this.unit1,
          unit2: unit2 ?? this.unit2,
          unit3: unit3 ?? this.unit3,
         model1: model1 ?? this.model1,
        model2: model2 ?? this.model2,
        attendance: attendance ?? this.attendance,
        assignment: assignment ?? this.assignment



      );
  static User fromJson (Map<String, dynamic> json) =>
      User(
        regno: json[UserFields.regno],
        name: json[UserFields.name],
        unit1: json[UserFields.unit1],
        unit2: json[UserFields.unit2],
        unit3: json[UserFields.unit3],
        model1: json[UserFields.model1],
        model2: json[UserFields.model2],
        attendance: json[UserFields.attendance],
        assignment: json[UserFields.assignment]
      );
  Map<String,dynamic> toJson() =>{

    UserFields.name : name,
    UserFields.regno : regno,
    UserFields.unit1:unit1,
    UserFields.unit2:unit2,
    UserFields.unit3:unit3,
    UserFields.model1:model1,
    UserFields.model2:model2,
    UserFields.attendance:attendance,
    UserFields.assignment:assignment
  };
  Map<String,dynamic> toGsheets(){
    return{
      'name' : name,
      'regno' : regno,
      'unit1':unit1,
      'unit2':unit2,
      'unit3':unit3,
      'model1':model1,
      'model2':model2
    };
  }


}
