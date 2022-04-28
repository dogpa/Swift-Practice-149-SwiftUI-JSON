//
//  SearchResponse.swift
//  Swift Practice 149 SwiftUI JSON
//
//  Created by Dogpa's MBAir M1 on 2022/4/26.
//

import Foundation

//依照APPLE Search API的JSON格式建立搜尋結果的struct SearchResponse
struct SearchResponse: Codable, Hashable {
    let resultCount: Int            //依照JSON規則建立同名resultCount
    let results: [SingerDetails]    //依照JSON規則建立同名results並指派為自定義的struct[SingerDetails] Array
}

//依照APPLE Search API的JSON命名規則取相同名字的對應內容
struct SingerDetails: Codable, Hashable {
    
    var artistName: String  //歌手名稱
    let trackName: String   //歌曲名稱
    let artworkUrl100: URL  //100*100像素照片網址

}
