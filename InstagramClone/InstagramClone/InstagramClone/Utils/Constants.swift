//
//  Constant.swift
//  InstagramClone
//
//  Created by Kim Yewon on 2022/10/07.
//

import Foundation
import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLWERS = Firestore.firestore().collection("Followers")
let COLLECTION_FOLLWING = Firestore.firestore().collection("Following")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
