//
//  SplashView.swift
//  meusFilmesAPI
//
//  Created by Jean Ramalho on 27/02/25.
//
import Foundation
import UIKit

class SplashView: UIView {
    
    lazy var nomeAppLabel: UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Meus Filmes API"
        label.font = UIFont.boldSystemFont(ofSize: 48)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = .white
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        addSubview(nomeAppLabel)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            nomeAppLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nomeAppLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
}
