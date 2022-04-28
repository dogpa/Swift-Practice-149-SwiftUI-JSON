//
//  AlbumImageView.swift
//  Swift Practice 149 SwiftUI JSON
//
//  Created by Dogpa's MBAir M1 on 2022/4/28.
//

import SwiftUI

struct AlbumImageView: View {
    
    let albumUrlStr: String         //接收照片的網址字串
    @State var albumData: Data?     //透過albumUrlStr網路存取Data後的照片資料
    
    var body: some View {
        //如果data存入albumData並且接其設置為UIImage的資料的話顯示照片
        //若無的話設置"arrow.down.heart"的SF symbol並在其顯示時執行自定義的fetchAlbum function
        if let data = albumData, let albumImage = UIImage(data: data) {
            Image(uiImage: albumImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .background(.gray)
        }else{
            Image(systemName: "arrow.down.heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .background(.gray)
                .onAppear{fetchAlbum()}
        }
    }
    
    ///透過albumUrlStr與URLSession取得照片的data取得後指派給albumData
    private func fetchAlbum () {
        guard let url = URL(string: albumUrlStr) else {return}
        let task = URLSession.shared.dataTask(with: url) {data, _, _ in
            self.albumData = data
        }
        task.resume()
    }
}
