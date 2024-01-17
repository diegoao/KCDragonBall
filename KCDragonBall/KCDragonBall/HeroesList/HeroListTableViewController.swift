//
//  HeroListTableViewController.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 16/1/24.
//

import UIKit

final class HeroListTableViewController: UITableViewController {
    typealias DataSource = UITableViewDiffableDataSource<Int,DragonBallHero>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, DragonBallHero>
    private let model: NetworkModel = .shared
    private var dataSource: DataSource?
    private var heroes: [DragonBallHero] = []



    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        model.getHeroes { [weak self] result in
            switch result {
                case let .success(listHeroData):
                    var snapshot = Snapshot()
                    snapshot.appendSections([0])
                    snapshot.appendItems(listHeroData)
                    self?.heroes = listHeroData
                  //  print(listHeroData)
                    self?.dataSource?.apply(snapshot)
                case let .failure(error):
                    print("🔴 \(error)")
                
            }
        }
         
        tableView.register(
            UINib(nibName: HeroTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: HeroTableViewCell.identifier)
          
    
        
        dataSource = DataSource(tableView: tableView) { tableView, indexPath, heroe in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: HeroTableViewCell.identifier,
                for: indexPath
            ) as? HeroTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: heroe)
            return cell
        }
        
        tableView.dataSource = dataSource
        

    }
}
        
// MARK: - Configuration
private extension HeroListTableViewController {
    func setUpView() {
        title = "LISTADO PERSONAJES"
    }
}

// MARK: - TableView Delegate
extension HeroListTableViewController {
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let heroe = self.heroes[indexPath.row]
        let detailViewController = DetailHeroesViewController(heroe: heroe)
        navigationController?.show(detailViewController, sender: nil)
    }
 
    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        120
    }
}
