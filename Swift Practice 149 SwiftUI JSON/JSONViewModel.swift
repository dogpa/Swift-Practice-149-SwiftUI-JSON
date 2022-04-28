//
//  JSONViewModel.swift
//  Swift Practice 149 SwiftUI JSON
//
//  Created by Dogpa's MBAir M1 on 2022/4/26.
//

import Foundation

class JSONViewModel: ObservableObject {

    //存放歌手歌曲資料的Array
    @Published var responses: [SingerDetails] = []
    
    //存放歌手姓名
    @Published var singerName :String = ""
    
    func fetchSignerInfo () {
        
        //歌手名稱Array
        var singerArray = ["周杰倫","五月天","梁靜茹","蘇打綠","蕭煌奇","張惠妹","伍佰","蔡依林","徐佳瑩","韋禮安"]

        //singerArray隨機排列
        singerArray.shuffle()
        
        //取得singerArray第一個值放入到API當中進行資料索取，並透過轉碼將中文字轉換成url能辨識的狀態
        let randomUrl = "https://itunes.apple.com/search?term=\(singerArray[0])&media=music"
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        //指派url
        guard let url = URL(string: randomUrl!) else {return}
        
        //透過URLSession進行JSON資料取得
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            //指派data，並確認沒有錯誤
            guard let data = data, error == nil else {return}
            
            //透過do catch將剛剛取得的data利用JSONDecoder解碼
            //若成功將result存入到responses當中，歌手的姓名存入到singerName
            do{
                let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.responses = searchResponse.results
                    self?.singerName = singerArray[0]
                }
            }catch{
                print(error)
            }
        }
        //執行task
        task.resume()
    }
}
