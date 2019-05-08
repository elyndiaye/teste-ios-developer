//
//  Constants.swift
//  iCasei
//
//  Created by ely.assumpcao.ndiaye on 07/05/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

import Foundation

typealias CompletionHandler = (_ Success: Bool, _ errorMessage :String?) -> ()

// URL Constants
let BASE_URL = "https://www.googleapis.com/youtube/v3/search?part=id,snippet&q="
let API_KEY = "&key=AIzaSyB0FT-tkI4FKYNsmKe9gGdfQzydTonl6zk"
let VIDEO_URL = "https://www.googleapis.com/youtube/v3/videos?id="
let API_KEY_VIDEO = "&part=snippet,statistics&key=AIzaSyB0FT-tkI4FKYNsmKe9gGdfQzydTonl6zk"


//Segues
let TO_VIDEO = "toVideo"
let TO_SELECTED_VIDEO = "toSelectedVideo"

// User Defaults
let TOKEN_KEY = "token"
let TITLE = "title"
let DISLIKES = "disLikes"
let LIKES = "likes"
let VIEW_COUNT = "viewCount"
let DESCRIPTION = "description"
let USER_NAME = "userName"
let IMG = "Img"

// Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
