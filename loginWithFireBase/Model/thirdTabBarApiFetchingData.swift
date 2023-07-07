//
//  thirdTabBarApiFetchingData.swift
//  loginWithFireBase
//
//  Created by Rajeev on 08/05/23.
//

import Foundation
import SwiftyJSON



struct ToDo:Codable
{
    let localized_name:String
    let img:String
   
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.localized_name = try container.decode(String.self, forKey: .localized_name)
        self.img = try container.decode(String.self, forKey: .img)
    }
}

//
//struct JsonModel
//{
//    var artistName:String = ""
//    var trackCensoredName: String = ""
//    var artworkUrl100:String = ""
//    var artistId:String = " "
//    var collectionCensoredName:String = ""
//    var country: String = ""
//
//    init()
//    {
//
//    }
//    init(json:JSON)
//    {
//        artistName = json["artistName"].stringValue
//        trackCensoredName  = json["trackCensoredName"].stringValue
//        artworkUrl100 = json["artworkUrl100"].stringValue
//        artistId = json[""].stringValue
//        collectionCensoredName = json[" collectionCensoredName"].stringValue
//        country = json["country"].stringValue
//    }
//}
