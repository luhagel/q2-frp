//
//  GamesTableViewController.swift
//  TicTacToe
//
//  Created by Luca Hagel on 11/15/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GamesTableViewController: UITableViewController {
  
    var games: Variable<[Board]> = Variable([])
  
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = nil
        self.tableView.dataSource = nil
      
      games.asObservable().bindTo(self.tableView.rx.items(cellIdentifier: "Cell", cellType: UITableViewCell.self)) { (identifier: Int, board: Board, cell: UITableViewCell) in
          if (board.winner() != nil) {
            cell.textLabel?.text = "Win: \(board.winner())"
          } else {
            cell.textLabel?.text = "In Progress: \(board.playerWithCurrentTurn())"
          }
        }.addDisposableTo(disposeBag)
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destination = segue.destination as! ViewController
    destination.addGames = {
      self.games.value.append($0)
    }
  }

}
