import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService{
     searchByName(String searchField){
       return Firestore.instance.collection('bachillerato').document('principal').collection('tematico')
              .where('searchKey',isEqualTo: searchField.substring(0,1).toUpperCase()).getDocuments();
     }
     searchByName2(String searchField){
       return Firestore.instance.collection('bachillerato').document('principal').collection('interes')
           .where('searchKey',isEqualTo: searchField.substring(0,1).toUpperCase()).getDocuments();
     }
     searchByName3(String searchField){
       return Firestore.instance.collection('bachillerato').document('principal').collection('jugando')
           .where('searchKey',isEqualTo: searchField.substring(0,1).toUpperCase()).getDocuments();
     }

}