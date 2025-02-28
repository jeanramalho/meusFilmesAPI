//
//  MeusFilmesAPIFlowController.swift
//  meusFilmesAPI
//
//  Created by Jean Ramalho on 27/02/25.
//
import Foundation
import UIKit

class MeusFilmesAPIFlowController: MeusFilmesAPICoordinatorProtocol {
    
    private var navigationController: UINavigationController?
    
    public init(){
        
    }
    
    func start() -> UINavigationController {
        
        let contentView = SplashView()
        let startViewController = SplashViewController(contentView: contentView, coordinator: self)
        self.navigationController = UINavigationController.init(rootViewController: startViewController)
        
        return navigationController ?? UINavigationController()
    }
    
    func showHomeView(){
        
        let contentView = HomeView()
        let homeView = HomeViewController(contentView: contentView, coordinator: self)
        self.navigationController?.setViewControllers([homeView], animated: true)
    }
    
    func showDetalhesView(filme: Movie){
        let contentView = DetalhesView()
        let detalhesView = DetalhesViewController(contentView: contentView, filme: filme)
        self.navigationController?.pushViewController(detalhesView, animated: true)
    }
}

