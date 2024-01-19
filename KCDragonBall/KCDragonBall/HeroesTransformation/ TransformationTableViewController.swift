//
//  TrasnformationTableViewController.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 17/1/24.
//


import UIKit

final class TransformationTableViewController: UITableViewController {
    typealias DataSource = UITableViewDiffableDataSource<Int,DGHeroTransformation>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, DGHeroTransformation>
    private let model: NetworkModel = .shared
    private var dataSource: DataSource?
    private var transformation: [DGHeroTransformation] = []



    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    
        
        model.getTrasnformation(id:"EA0D9204-9894-4A86-B7F1-92DDBBC8BD23") { [weak self] result in
            switch result {
                case let .success(listHeroTransf):
                    var snapshot = Snapshot()
                    snapshot.appendSections([0])
                    snapshot.appendItems(listHeroTransf)
                    self?.transformation = listHeroTransf
                     print(listHeroTransf)
                    self?.dataSource?.apply(snapshot)
                case let .failure(error):
                    print("🔴 \(error)")
                
            }
        }
         
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
        

    }
}
        
// MARK: - Configuration
private extension TransformationTableViewController {
    func setUpView() {
        title = "TRANSFORMACIONES"
    }
}

// MARK: - TableView Delegate
extension TransformationTableViewController {
//    override func tableView(
//        _ tableView: UITableView,
//        didSelectRowAt indexPath: IndexPath
//    ) {
//        let transfor = self.transformation[indexPath.row]
//        let detailViewController = DetailHeroesViewController(heroe: transfor)
//        navigationController?.show(detailViewController, sender: nil)
//    }
 
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        120
    }
}
