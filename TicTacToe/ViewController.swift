//
//  ViewController.swift
//  TicTacToe
//
//  Created by Apple on 15.11.24.
//

import UIKit

class ViewController: UIViewController {
    // all variables
    enum Turn {
        case Nought
        case Cross
    }
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    var NOUGHT = "O"
    var CROSS = "X"
    var crossesScore = 0
    var noughtsScore = 0
    var board = [UIButton]()
    // // // // // // // // // // // // // // // //
    
    
    // all ui components
    private let turnTitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Turn"
        lb.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        return lb
    }()
    private let turnLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "X"
        lb.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        return lb
    }()
    private let verticalSV: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 5
        sv.backgroundColor = .black
        sv.axis = .vertical
        return sv
    }()
    private let aHorizontalSV: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .black
        sv.spacing = 5
        sv.axis = .horizontal
        return sv
    }()
    private let a1Button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let a2Button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let a3Button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let bHorizontalSV: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .black
        sv.spacing = 5
        sv.axis = .horizontal
        return sv
    }()
    private let b1Button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let b2Button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let b3Button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let cHorizontalSV: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .black
        sv.spacing = 5
        sv.axis = .horizontal
        return sv
    }()
    private let c1Button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let c2Button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    private let c3Button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 55, weight: .bold)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    // // // // // // // // // // // // // // // // // // // // // // // // // //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupAction()
    }
    
    // Setup constraints function
    private func setupUI(){
        view.addSubview(turnTitleLabel)
        view.addSubview(turnLabel)
        view.addSubview(verticalSV)
        [aHorizontalSV, bHorizontalSV, cHorizontalSV].forEach(verticalSV.addArrangedSubview)
        [a1Button, a2Button, a3Button].forEach(aHorizontalSV.addArrangedSubview)
        [b1Button,b2Button,b3Button].forEach(bHorizontalSV.addArrangedSubview)
        [c1Button,c2Button,c3Button].forEach(cHorizontalSV.addArrangedSubview)
        
        NSLayoutConstraint.activate([
            turnTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            turnTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            turnLabel.topAnchor.constraint(equalTo: turnTitleLabel.bottomAnchor, constant: 8),
            turnLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            verticalSV.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            verticalSV.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            a1Button.widthAnchor.constraint(equalToConstant: 100),
            a1Button.heightAnchor.constraint(equalToConstant: 100),
            a2Button.widthAnchor.constraint(equalToConstant: 100),
            a2Button.heightAnchor.constraint(equalToConstant: 100),
            a3Button.widthAnchor.constraint(equalToConstant: 100),
            a3Button.heightAnchor.constraint(equalToConstant: 100),
            b1Button.widthAnchor.constraint(equalToConstant: 100),
            b1Button.heightAnchor.constraint(equalToConstant: 100),
            b2Button.widthAnchor.constraint(equalToConstant: 100),
            b2Button.heightAnchor.constraint(equalToConstant: 100),
            b3Button.widthAnchor.constraint(equalToConstant: 100),
            b3Button.heightAnchor.constraint(equalToConstant: 100),
            c1Button.widthAnchor.constraint(equalToConstant: 100),
            c1Button.heightAnchor.constraint(equalToConstant: 100),
            c2Button.widthAnchor.constraint(equalToConstant: 100),
            c2Button.heightAnchor.constraint(equalToConstant: 100),
            c3Button.widthAnchor.constraint(equalToConstant: 100),
            c3Button.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
    
    // all button actions
    private func setupAction(){
        initBoard()
        a1Button.addTarget(self, action: #selector(addToBoard(_:)), for: .touchUpInside)
        a2Button.addTarget(self, action: #selector(addToBoard(_:)), for: .touchUpInside)
        a3Button.addTarget(self, action: #selector(addToBoard(_:)), for: .touchUpInside)
        b1Button.addTarget(self, action: #selector(addToBoard(_:)), for: .touchUpInside)
        b2Button.addTarget(self, action: #selector(addToBoard(_:)), for: .touchUpInside)
        b3Button.addTarget(self, action: #selector(addToBoard(_:)), for: .touchUpInside)
        c1Button.addTarget(self, action: #selector(addToBoard(_:)), for: .touchUpInside)
        c2Button.addTarget(self, action: #selector(addToBoard(_:)), for: .touchUpInside)
        c3Button.addTarget(self, action: #selector(addToBoard(_:)), for: .touchUpInside)
    }
    // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
    
    @objc
    private func addToBoard(_ sender: UIButton){
        if(sender.title(for: .normal) == nil){
            if(currentTurn == Turn.Nought){
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            } else if(currentTurn == Turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
            }
        }
        
        sender.isEnabled = false
        checkWinningSide()
    }
    // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
    
    func checkWinningSide(){
        if checkForVictory(CROSS){
            crossesScore+=1
            resultAlert(title: "Crosses win!")
        }
        if checkForVictory(NOUGHT){
            noughtsScore+=1
            resultAlert(title: "Noughts win!")
        }
        if(fullBoard()){
            resultAlert(title: "Finish")
        }
    }
    // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
    
    func initBoard(){
        board.append(a1Button)
        board.append(a2Button)
        board.append(a3Button)
        board.append(b1Button)
        board.append(b2Button)
        board.append(b3Button)
        board.append(c1Button)
        board.append(c2Button)
        board.append(c3Button)
    }
    // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
    
    func checkForVictory(_ s: String) -> Bool {
        
        // Horizontal Victory
        if thisSymbol(a1Button, s) && thisSymbol(a2Button, s) && thisSymbol(a3Button, s){
            return true
        }
        if thisSymbol(b1Button, s) && thisSymbol(b2Button, s) && thisSymbol(b3Button, s){
            return true
        }
        if thisSymbol(c1Button, s) && thisSymbol(c2Button, s) && thisSymbol(c3Button, s){
            return true
        }
        
        // Vertical Victory
        if thisSymbol(a1Button, s) && thisSymbol(b1Button, s) && thisSymbol(c1Button, s){
            return true
        }
        if thisSymbol(a2Button, s) && thisSymbol(b2Button, s) && thisSymbol(c2Button, s){
            return true
        }
        if thisSymbol(a3Button, s) && thisSymbol(b3Button, s) && thisSymbol(c3Button, s){
            return true
        }
        
        // Diagonal Victory
        if thisSymbol(a1Button, s) && thisSymbol(b2Button, s) && thisSymbol(c3Button, s){
            return true
        }
        if thisSymbol(a3Button, s) && thisSymbol(b2Button, s) && thisSymbol(c1Button, s){
            return true
        }
        
        return false
    }
    // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
    
    func resultAlert(title: String){
        let message = "\nNoughts " + String(noughtsScore) + "\nCrosses " + String(crossesScore)
        let alertAction = UIAlertAction(title: "Reset", style: .default) { (_) in
            self.resetBoard()
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
    // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
    
    func resetBoard(){
        for button in board{
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if(firstTurn == Turn.Nought){
            firstTurn = Turn.Cross
            turnLabel.text = CROSS
        } else if (firstTurn == Turn.Cross){
            firstTurn = Turn.Nought
            turnLabel.text = NOUGHT
        }
        currentTurn = firstTurn
    }
    // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
    
    func fullBoard() -> Bool {
        for button in board {
            if(button.title(for: .normal) == nil){
                return false
            }
        }
        return true
    }
    // // // // // // // // // // // // // // // // // // // // // // // // // // // // //
}

