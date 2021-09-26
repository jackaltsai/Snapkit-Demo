//
//  CarousalCollectionCell.swift
//  Snapkit Demo
//
//  Created by 蔡忠翊 on 2021/9/26.
//

import UIKit

class CarousalCollectionCell: UICollectionViewCell {
    static let identifier = "CarousalCollectionCell"
    
    private let carousalPadding: CGFloat = 60.0
    
    private lazy var carousalView: CarousalView = {
        let frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height - carousalPadding)
        let carousalView = CarousalView(frame: frame)
        
        contentView.addSubview(carousalView)
        
        carousalView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(carousalPadding)
            
        }
        
        return carousalView
    }()
    
    private lazy var likeButton: UIButton = {
       let button = UIButton()
        contentView.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalTo(carousalView.snp.bottom).offset(8)
            make.right.equalToSuperview().inset(20)
        }
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(carousalView.snp.bottom).offset(4)
            make.right.equalTo(likeButton.snp.left).inset(8)
        }
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.right.equalTo(likeButton.snp.left).inset(8)
        }
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    var cellModel: Model? {
        didSet {
            
            setupUI(cellModel: cellModel)
            
        }
    }
    
    func setupUI(cellModel: Model?) {
        guard let cellModel = cellModel else {
            return
        }
        
        carousalView.model = cellModel.model
        titleLabel.text = cellModel.title
        descriptionLabel.text = cellModel.description
        let image = cellModel.liked ? UIImage(named: "heartFill") : UIImage(named: "heartEmpty")
        likeButton.setImage(image, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    struct Model {
        var title: String?
        var description: String?
        var liked: Bool
        var model: CarousalView.Model?
    }
    
    override func prepareForReuse() {
        cellModel = nil
    }
    
}
