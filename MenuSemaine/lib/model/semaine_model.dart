class SemaineModel
{
  List<String> menu = [];

  SemaineModel();

  Map<String, dynamic> toJson() {
    return {
      '"lundi"': '"${menu[0]}"',
      '"mardi"': '"${menu[1]}"' ,
      '"mercredi"': '"${menu[2]}"',
      '"jeudi"':  '"${menu[3]}"',
      '"vendredi"':  '"${menu[4]}"',
      '"samedi"': '"${menu[5]}"',
      '"dimanche"': '"${menu[6]}"',
    };
  }


  List<String> fromJ(Map<String, dynamic> json){

    List<String> f = [];
    f.add(json['lundi']);
    f.add(json['mardi']);
    f.add(json['mercredi']);
    f.add(json['jeudi']);
    f.add(json['vendredi']);
    f.add(json['samedi']);
    f.add(json['dimanche']);

    return f;

  }



}