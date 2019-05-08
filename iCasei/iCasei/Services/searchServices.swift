//
//  searchServices.swift
//  iCasei
//
//  Created by ely.assumpcao.ndiaye on 07/05/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Alamofire
import SwiftyJSON


class searchServices{
    
    static let instance = searchServices()
    
    let defaults = UserDefaults.standard
    
    var title: String {
        get {
            return defaults.value(forKey: TITLE) as! String
        }
        set {
            defaults.set(newValue, forKey: TITLE)
        }
    }
    
    var description: String {
        get {
            return defaults.value(forKey: DESCRIPTION) as! String
        }
        set {
            defaults.set(newValue, forKey: DESCRIPTION)
        }
    }
    var deslikes: String {
        get {
            return defaults.value(forKey: DISLIKES) as! String
        }
        set {
            defaults.set(newValue, forKey: DISLIKES)
        }
    }
    var likes: String {
        get {
            return defaults.value(forKey: LIKES) as! String
        }
        set {
            defaults.set(newValue, forKey: LIKES)
        }
    }
    var viewCount: String {
        get {
            return defaults.value(forKey: VIEW_COUNT) as! String
        }
        set {
            defaults.set(newValue, forKey: VIEW_COUNT)
        }
    }
    var Img: String {
        get {
            return defaults.value(forKey: IMG) as! String
        }
        set {
            defaults.set(newValue, forKey: IMG)
        }
    }
    
    //Objeto instanciado
    var apiResults = [ApiResult]()
    var selectedVideo : ApiResult?
    var videos = [Video]()
    
    func findAllSearchs(search: String, completion: @escaping CompletionHandler) {
        //"\(BASE_URL)/\(user)/repos"
        Alamofire.request("\(BASE_URL)\(search)\(API_KEY)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            print(response.result)
            if response.result.error == nil {
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    json["items"].array?.forEach({(item)in
                        let title = item["snippet"]["title"].stringValue
                        print(title)
                        let description = item["snippet"]["description"].stringValue
                        let thumbnails = item["snippet"]["thumbnails"]["default"]["url"].stringValue
                        let videoId = item["id"]["videoId"].stringValue
                        print(videoId)
                        let apiResult = ApiResult(title: title, description: description, thumbnails: thumbnails, videoId : videoId)
                        self.apiResults.append(apiResult)
                    print(title)
                    print(description)
                    print(thumbnails)
                    print(videoId)
                    })
                    completion(true, "OK")
                case .failure( _):
                    print(response.result.error as Any)
                    debugPrint(response.result.error as Any)
                    completion(false, "User not found. Please enter another name.")
                } // Switcase
            }// response resultt
            else {
                if let error = response.result.error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                    completion(false, "A network error has occurred. Check your Internet connection and try again later.")
                    print(error)
                }//error COnnection
                completion(false, "Search not found. Please enter another search")
                print(response.response?.statusCode as Any)
                debugPrint(response.result.error as Any)
            }
        }// alamo.request
    }//findAllSearchs
    
    func findVideo(videoID: String, completion: @escaping CompletionHandler) {
        //"\(BASE_URL)\(search)\(API_KEY)"
        Alamofire.request("\(VIDEO_URL)\(videoID)\(API_KEY_VIDEO)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            print(response.result)
            if response.result.error == nil {
                switch response.result{
                case .success(let value):
                    let json = JSON(value)
                    json["items"].array?.forEach({(item)in
                        let title = item["snippet"]["title"].stringValue
                        self.title = title
                        let description = item["snippet"]["description"].stringValue
                        self.description = description
                        let thumbnails = item["snippet"]["thumbnails"]["default"]["url"].stringValue
                        self.Img = thumbnails
                        let likeCount = item["statistics"]["likeCount"].stringValue
                        self.likes = likeCount
                        let dislikeCount = item["statistics"]["dislikeCount"].stringValue
                        self.deslikes = dislikeCount
                        let viewCount = item["statistics"]["viewCount"].stringValue
                        self.viewCount = viewCount
                        let video = Video(title: title, description: description, thumbnails: thumbnails, likeCount : likeCount, dislikeCount : dislikeCount, viewCount : viewCount)
                        self.videos.append(video)
                    })
                    completion(true, "OK")
                case .failure( _):
                    print(response.result.error as Any)
                    debugPrint(response.result.error as Any)
                    completion(false, "Not Found.")
                } // Switcase
            }// response resultt
            else {
                if let error = response.result.error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                    completion(false, "A network error has occurred. Check your Internet connection and try again later.")
                    print(error)
                }//error COnnection
                completion(false, "Not Found")
                print(response.response?.statusCode as Any)
                debugPrint(response.result.error as Any)
            }
        }// alamo.request
    }
    
    func clear() {
        title.removeAll()
        deslikes.removeAll()
        description.removeAll()
        Img.removeAll()
        likes.removeAll()
        viewCount.removeAll()
    }
    
    func clearAll() {
        title.removeAll()
        deslikes.removeAll()
        description.removeAll()
        Img.removeAll()
        likes.removeAll()
        viewCount.removeAll()
        apiResults.removeAll()
        videos.removeAll()
    }
    
}

