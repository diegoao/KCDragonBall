//
//  TransforTableViewController.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 21/1/24.
//

import UIKit

class TransforTableViewController: UIViewController, UITableViewDelegate {
    
    typealias DataSource = UITableViewDiffableDataSource<Int,DGHeroTransformation>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, DGHeroTransformation>
    private var dataSource: DataSource?
    var listHeroTransf: [DGHeroTransformation] = []
    
    // MARK: - Outlets
   
    @IBOutlet weak var tableView: UITableView!
    @IBAction func returnButton(_ sender: UIButton) {
        let heroesListViewController = HeroesListTableViewController()
        self.navigationController?.setViewControllers([heroesListViewController], animated: true)
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad(){
        super.viewDidLoad()
        setUpView()
        tableView.delegate = self
    

        tableView.register(
            UINib(nibName: TransformationTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: TransformationTableViewCell.identifier)
        
        
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, transf in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TransformationTableViewCell.identifier,
                for: indexPath
            ) as? TransformationTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: transf)
            return cell
        }
        
        tableView.dataSource = dataSource
    
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(listHeroTransf)
        self.dataSource?.apply(snapshot)
        
        
    }
}
        
// MARK: - Configuration
private extension TransforTableViewController {
    func setUpView() {
        title = "TRANSFORMATIONS"
    }
}

// MARK: - TableView Delegate
extension TransforTableViewController {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let transfor = self.listHeroTransf[indexPath.row]
        let detailViewController = TransforDetailViewController(heroe: transfor)
        navigationController?.show(detailViewController, sender: nil)
    }
 
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
       155
    }
}
