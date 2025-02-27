//
//  PopularCollectionViewCell.swift
//  meusFilmesAPI
//
//  Created by Jean Ramalho on 27/02/25.
//
import Foundation
import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    lazy var capaFilmeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.backgroundColor = .red
        return image
    }()
    
    lazy var tituloFilmeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "texto testando teste testando teste"
        return label
    }()
    
    static let identifier: String = "PopularCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        contentView.addSubview(capaFilmeImageView)
        contentView.addSubview(tituloFilmeLabel)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            capaFilmeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            capaFilmeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            capaFilmeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            capaFilmeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),
            
            tituloFilmeLabel.topAnchor.constraint(equalTo: capaFilmeImageView.bottomAnchor, constant: 8),
            tituloFilmeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            tituloFilmeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
        ])
    }
}
