//
//  Video.swift
//  iCasei
//
//  Created by ely.assumpcao.ndiaye on 08/05/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

struct Video {
    static let instance = Video()
    public private(set) var title: String!
    public private(set) var description: String!
    public private(set) var thumbnails: String!
    public private(set) var likeCount: String!
    public private(set) var dislikeCount: String!
    public private(set) var viewCount: String!
    
}
