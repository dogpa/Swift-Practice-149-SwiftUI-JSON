//
//  ContentView.swift
//  Swift Practice 149 SwiftUI JSON
//
//  Created by Dogpa's MBAir M1 on 2022/4/26.
//

import SwiftUI

struct ContentView: View {
    
    //設定JSONViewModel後續使用
    @StateObject var jsonVM = JSONViewModel()

    var body: some View {
        
        //Vstack內設定一個NavigationView放入歌手的歌曲照片與歌曲名稱
        //button則為執行jsonVM內的隨機取得歌手資訊的function
        //onAppear執行第一次JSONViewModel內隨機取得照片的function
        VStack{
            NavigationView{
                List {
                    ForEach(jsonVM.responses, id:\.self) { singer in
                        HStack{
                            AlbumImageView(albumUrlStr: "\(singer.artworkUrl100)", albumData: nil)
                            Text(singer.trackName)
                                .bold()
                        }
                    }
                }
                .navigationTitle("\(jsonVM.singerName) 歌曲列表")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    jsonVM.fetchSignerInfo()
                }
            }

            Button {
                jsonVM.fetchSignerInfo()
            } label: {
                Text("點我換歌手")
                    .font(.system(size: 25))
                    .padding()
                    .background(.gray)
                    .cornerRadius(10)
                    .foregroundColor(.black)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
