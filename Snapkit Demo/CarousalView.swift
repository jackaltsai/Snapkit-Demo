//
//  CarousalView.swift
//  Snapkit Demo
//
//  Created by 蔡忠翊 on 2021/9/26.
//

import UIKit

class CarousalView: UIView {

    private lazy var imageViewOne: UIImageView = {
        let imageView = UIImageView()
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().offset((-(frame.width / 2) - 20))
        }
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var imageViewTwo: UIImageView = {
        let imageView = UIImageView()
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.left.equalTo(imageViewOne.snp.right).offset(1)
            make.top.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview().offset((-(frame.height / 2) - 1))
        }
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageViewThree: UIImageView = {
        let imageView = UIImageView()
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.left.equalTo(imageViewOne.snp.right).offset(1)
            make.top.equalTo(imageViewTwo.snp.bottom).offset(1)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var imageViews = [imageViewOne, imageViewTwo, imageViewThree]
    
    var model: Model?{
        didSet {
            if let model = model {
                setupView(model: model)
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(model: Model) {
        for (index, view) in imageViews.enumerated() {
            let hasAnotherImage = model.images.count > index
            if hasAnotherImage {
                view.image = model.images[index]
            }
        }
    }
    
    
    struct Model {
        var images: [UIImage]
    }

}
