//
//  ThemeScreenViewController.swift
//  CardFlip
//
//  Created by Ilya on 16.04.22.
//

import UIKit

class ThemeScreenViewController: UIViewController {
    // - UI
    @IBOutlet weak var tableView: UITableView!
    
    // - Actions
    @IBAction func buttonTouchesStarted(_ sender: UIButton) {
        sender.pressedDown()
    }
    
    @IBAction func buttonTouchesEnded(_ sender: UIButton) {
        sender.pressedUp({ [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        })
    }
    
    @IBAction func buttonTouchesEndedOutside(_ sender: UIButton) {
        sender.pressedUp({ _ in })
    }
    
    // - Data
    let themes = ["Cats", "Dogs", "Logos"]
    
    // - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

// MARK: -TableViewDelegate
extension ThemeScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ThemeTableViewCell
        let defaults = UserDefaults.standard
        defaults.setValue(cell.themeLabel.text, forKey: theme)
    }
}

// MARK: - TableViewDataSource
extension ThemeScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTableViewCell", for: indexPath) as! ThemeTableViewCell
        let defaults = UserDefaults.standard
        cell.themeLabel.text = themes[indexPath.row]
        if cell.themeLabel.text == defaults.string(forKey: theme) {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - Configure
extension ThemeScreenViewController {
    func configure() {
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
