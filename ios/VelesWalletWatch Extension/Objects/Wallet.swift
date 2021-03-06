//
//  Wallet.swift
//  VelesWalletWatch Extension
//
//  Created by Marcos Rodriguez on 3/13/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation

class Wallet: NSObject, NSCoding {
  static let identifier: String = "Wallet"

  var identifier: Int?
  let label: String
  let balance: String
  let type: String
  let preferredBalanceUnit: String
  let receiveAddress: String
  let transactions: [Transaction]
  
  init(label: String, balance: String, type: String, preferredBalanceUnit: String, receiveAddress: String, transactions: [Transaction], identifier: Int) {
    self.label = label
    self.balance = balance
    self.type = type
    self.preferredBalanceUnit = preferredBalanceUnit
    self.receiveAddress = receiveAddress
    self.transactions = transactions
    self.identifier = identifier
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(label, forKey: "label")
    aCoder.encode(balance, forKey: "balance")
    aCoder.encode(type, forKey: "type")
    aCoder.encode(receiveAddress, forKey: "receiveAddress")
    aCoder.encode(preferredBalanceUnit, forKey: "preferredBalanceUnit")
    aCoder.encode(transactions, forKey: "transactions")
    aCoder.encode(identifier, forKey: "identifier")
  }
  
  required init?(coder aDecoder: NSCoder) {
    label = aDecoder.decodeObject(forKey: "label") as! String
    balance = aDecoder.decodeObject(forKey: "balance") as! String
    type = aDecoder.decodeObject(forKey: "type") as! String
    preferredBalanceUnit = aDecoder.decodeObject(forKey: "preferredBalanceUnit") as! String
    receiveAddress = aDecoder.decodeObject(forKey: "receiveAddress") as! String
    transactions = aDecoder.decodeObject(forKey: "transactions") as? [Transaction] ?? [Transaction]()
  }

}
