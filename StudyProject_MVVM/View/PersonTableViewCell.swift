//
//  PersonTableViewCell.swift
//  MVVM_StudyProject_1
//
//  Created by Андрей Шевчук on 07.02.2021.
//

import UIKit

protocol PersonTableViewCellDelegate: AnyObject {
    func personFollowingTableViewCell(
        _ cell: PersonTableViewCell,
        didTappedWith viewModel: PersonViewModel)
}

class PersonTableViewCell: UITableViewCell {
    weak var delegate: PersonTableViewCellDelegate?
    private var viewModel: PersonViewModel?
    
    static let identifire: String = "PersonId"
    
    lazy private var itemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy private var nameTitle: UILabel = {
       let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy private var userTitle: UILabel = {
       let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    lazy private var button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(itemImage)
        contentView.addSubview(nameTitle)
        contentView.addSubview(userTitle)
        contentView.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // only for test
        let imageWidth = contentView.frame.size.height - 10
        itemImage.frame = CGRect(x: 5, y: 5,
                                 width: imageWidth,
                                 height: imageWidth)
        nameTitle.frame = CGRect(x: imageWidth + 10,
                                 y: 0,
                                 width: contentView.frame.size.width - imageWidth,
                                 height: contentView.frame.size.height / 2)
        userTitle.frame = CGRect(x: imageWidth + 10,
                                 y: contentView.frame.size.height / 2,
                                 width: contentView.frame.size.width - imageWidth,
                                 height: contentView.frame.size.height / 2)
        button.frame = CGRect(x: contentView.frame.size.width - 120,
                              y: 10,
                              width: 120,
                              height: contentView.frame.size.height - 20)
        button.addTarget(self, action: #selector(didTapped), for: .allEvents)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configurateModel(with viewModel: PersonViewModel) {
        self.viewModel = viewModel
        
        self.itemImage.image = viewModel.image
        self.nameTitle.text = viewModel.name
        self.userTitle.text = viewModel.userName
        
        if viewModel.currentlyFollowing {
            self.button.setTitle("Unfollow", for: .normal)
            self.button.setTitleColor(.red, for: .normal)
            self.button.layer.borderWidth = 1
            self.button.layer.borderColor = UIColor.black.cgColor
            self.button.backgroundColor = .blue
            
        } else {
            self.button.setTitle("Follow", for: .normal)
            self.button.setTitleColor(.green, for: .normal)
            self.button.layer.borderWidth = 1
            self.button.layer.borderColor = UIColor.black.cgColor
            self.button.backgroundColor = .white
        }
    }
    
    @objc func didTapped() {
        guard let viewModel = viewModel else { return }
        var newViewModel = viewModel
        newViewModel.currentlyFollowing = !viewModel.currentlyFollowing
        delegate?.personFollowingTableViewCell(self, didTappedWith: newViewModel)
        prepareForReuse()
        configurateModel(with: newViewModel)
    }
}
