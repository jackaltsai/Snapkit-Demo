//
//  HomeViewModel.swift
//  Snapkit Demo
//
//  Created by 蔡忠翊 on 2021/9/26.
//

import UIKit

class HomeViewModel {
    
    private let imageNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    private let titles = ["Nature", "Beaches", "Outdoor", "Playgroud", "Fun"]
    
    // MARK: - CollectionView Datasource
    func numberOfRows() -> Int {
        return 20
    }
    
    func modelFor(row: Int) -> CarousalCollectionCell.Model {
        let randomImages = imageNames.random(3)
        let title = titles.randomElement()
        let like = [true, false].randomElement() ?? false
        let carousalModel = CarousalView.Model(images: randomImages)
        let model = CarousalCollectionCell.Model(title: title, description: "This is demo description", liked: like, model: carousalModel)
        return model
    }
    
}

extension Collection {
    private func choose(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
    
    func random(_ n: Int) -> [UIImage] {
        let names = choose(n)
        let images = names.map { return UIImage(named: $0 as! String)! }
        return images
    }
    
    
}
