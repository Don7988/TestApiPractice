//
//  ViewController.swift
//  APIPractice
//
//  Created by Don Dominic on 24/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    var dataResponse : [DataModel] = []
    var apiController: APIController = APIController()
    var constants: Constants = Constants()
    var homeViewModel: [ViewModel] = []
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        
        // Do any additional setup after loading the view.
    }
    
    func getData(){
        apiController.getData(url: constants.url, completion: ({(response,error) in
            if let response = response{
                
                for dataDict in response as! [[String: Any]]{
                    self.dataResponse.append(DataModel(dataDict))
                }
                DispatchQueue.main.async {
                    print("value=============>\(self.dataResponse.count)")
                    self.appendModel()
                    self.tableView.reloadData()

                }
            }
            else if let error = error{
                print(error)
            } else {
                print("no value")
            }
        }))
    }
    func appendModel(){
        homeViewModel = []
        for (index, group) in dataResponse.enumerated(){
            let value = ViewModel(cellType: .homeCell)
            value.dataModel = group
            value.dataIndex = index
            homeViewModel.append(value)
        }
    }
}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = homeViewModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.identifier) as! HomeTableViewCell
        cell.cellModel = viewModel
        return cell
    }
    
    
}
