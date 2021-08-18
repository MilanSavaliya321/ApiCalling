//
//  ViewController.swift
//  ApiCalling
//
//  Created by Kartum Infotech on 17/08/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblApi: UITableView!
    
    //MARK:- Properties
    var viewModel = HomeViewModel()
    
    //MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK:- Functions
    private func setupUI() {
        setupTableView()
    }
    
    private func setupTableView() {
        tblApi.delegate = self
        tblApi.dataSource = self
        tblApi.register(ApiCell.nib, forCellReuseIdentifier: ApiCell.identifier)
        tblApi.reloadData()
    }
    
    //MARK:- IBActions
    
    
}

//MARK:- UITableViewDelegate,UITableViewDataSource
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrApi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ApiCell.identifier) as? ApiCell else{return UITableViewCell()}
        cell.config(index: viewModel.arrApi[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.arrApi[indexPath.row] {
        case .urlsessionjson:
            let vc = URLSession1VC.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case .jsondecoder:
            let vc = JsonDecodable2VC.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case .postapi:
            let vc = PostApiCall3VC.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case .postuploadimage:
            let vc = UploadImage4VC.instantiate(fromAppStoryboard: .Main)
            self.navigationController?.pushViewController(vc, animated: true)
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}
