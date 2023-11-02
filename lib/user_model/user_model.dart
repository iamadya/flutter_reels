class UserModel{
   final String? id;
   final String title;
   final String description;


   const UserModel({
    this.id,
     required this.title,
     required this.description,
});
   toJson(){
     return {
       "Title": title,
       "Description": description,
     };
   }
}