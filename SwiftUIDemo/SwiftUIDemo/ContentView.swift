//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Abdul Rahman Khan on 04/03/23.
//

import SwiftUI

struct Place: Identifiable {
    var id: Int
    var name: String
    var landmarks: [Landmark]
    
}

struct Landmark: Identifiable {
    var id: Int
    var name: String
    var image: UIImage
}



class Datasource {
    var dataArray: [Place]
    var myStr = String()
    init() {
        let landmarks = [Landmark(id: 1, name: "Sushil Nagar", image: UIImage(named: "IMG_1711")!), Landmark(id: 1, name: "Kamla Nagar", image: UIImage(named: "IMG_1712")!)]
        let landmarks2 = [Landmark(id: 1, name: "Sector-104", image: UIImage(named: "IMG_1713")!), Landmark(id: 1, name: "Sector - 105", image: UIImage(named: "IMG_1714")!)]
        self.dataArray = [Place(id: 1, name: "Agra", landmarks: landmarks),
                         Place(id: 2, name: "Noida",  landmarks: landmarks2)]
    }
}

struct PlaceCell: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            Image(uiImage: landmark.image).resizable().frame(width: 50, height: 50, alignment: .leading)
            Text(landmark.name)
        }
    }
}

struct ContentView: View {
   @State private var datasource = Datasource()
    var myText: String = String()
   
    var body: some View {
        NavigationView {
            VStack {
                Spacer(minLength: 20)
                TextField("Place holder", text: $datasource.myStr)
                Spacer(minLength: 100)
                Text(datasource.myStr)
                List {
                    ForEach(datasource.dataArray, id: \.id) { city in
                        Section(city.name) {
                            ForEach(city.landmarks, id: \.id) { landmark in
                                PlaceCell(landmark: landmark)
                            }
                        }
                    }
                }
            }
        }
    }
    func deleteData(index: IndexSet) {
        datasource.dataArray.remove(atOffsets: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
