//
//  ApiResult.swift
//  iCasei
//
//  Created by ely.assumpcao.ndiaye on 07/05/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation

struct ApiResult {
    static let instance = ApiResult()
    public private(set) var title: String!
    public private(set) var description: String!
    public private(set) var thumbnails: String!
    public private(set) var videoId: String!

}
