import 'dart:convert';

import 'package:app_12_01_firebase/model/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FacadeFirebaseFirestore
{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /*
   ATENCAO: Estou usando os mesmos metodos de parse da classe do modelo
            que sao usados tambem para CRUD em uma API REST.
   */

  // READ
  Future<List<Post>> readPost() async
  {
    List<Post> listObj = [];

    QuerySnapshot querySnapshot = await firestore.collection("post").get();

    /*
    // Estrategia 1: simples, mas um pouco ineficiente:
    for( DocumentSnapshot item in querySnapshot.docs )
    {
      Map<String, dynamic>? map = item.data() as Map<String, dynamic>?;
      Post post = Post.fromJson(map!);
      post.id = item.id;
      listObj.add(post);
    }
    */

    // Estrategia 2: confusa, mas um pouco mais eficiente:
    listObj = querySnapshot.docs.map( (item) {
      Post post = Post.fromJson(item.data() as Map<String, dynamic>);
      post.id = item.id;
      return post;
    }).toList();

    return listObj;
  }

  // CREATE
  Future<String> createPost(Post post) async
  {
    Map<String, dynamic> map = post.toJson();
    DocumentReference ref = await firestore.collection("post").add(map);

    return ref.toString(); // ID
  }

  // UPDATE (com put)
  Future<String> updatePost(String id, Post post) async
  {
    Map<String, dynamic> map = post.toJson();
    await firestore.collection("post").doc(id).set(map);

    return "OK";
  }

  // DELETE
  Future<String> deletePost(String id) async
  {
    await firestore.collection("post").doc(id).delete();

    return "OK";
  }

}