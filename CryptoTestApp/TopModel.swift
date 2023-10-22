//
//  TopModel.swift
//  CryptoTestApp
//
//  Created by Artem on 19.10.2023.
//

import Foundation

struct TopModel: Equatable {
    let position: Int
    let country: String
    let name: String
    var deposit: Int
    var profit: Int
}
struct Pair: Identifiable {
    let id: Int
    let pair: String
}

var currencyPairs = [
    Pair(id: 0, pair:"EUR/USD"),
    Pair(id: 1, pair:"RUB/USD"),
    Pair(id: 2, pair:"GPB/USD"),
    Pair(id: 3, pair:"USD/RUB"),
    Pair(id: 4, pair:"USD/EUR"),
    Pair(id: 5, pair:"EUR/USD"),
    Pair(id:6, pair:"RUB/USD"),
    Pair(id:7, pair:"GPB/USD"),
    Pair(id:8, pair:"USD/RUB"),
    Pair(id:9, pair:"USD/EUR"),
    Pair(id:10, pair:"GPB/USD"),
    Pair(id:11, pair:"USD/RUB"),
    Pair(id:12, pair:"USD/EUR"),
    Pair(id:13, pair:"RUB/USD")]

var mocData: [TopModel] = [
TopModel(position: 1, country: "korea", name: "Oliver", deposit: 9993, profit: 100000),
TopModel(position: 2, country: "korea", name: "Jack", deposit: 5555, profit: 15000),
TopModel(position: 3, country: "korea", name: "Oliver", deposit: 9993, profit: 100000),
TopModel(position: 4, country: "korea", name: "Jack", deposit: 5555, profit: 15000),
TopModel(position: 5, country: "korea", name: "Oliver", deposit: 9993, profit: 100000),
TopModel(position: 6, country: "korea", name: "Jack", deposit: 5555, profit: 15000),
TopModel(position: 7, country: "korea", name: "Oliver", deposit: 9993, profit: 100000),
TopModel(position: 8, country: "korea", name: "Jack", deposit: 5555, profit: 15000),
TopModel(position: 9, country: "korea", name: "Oliver", deposit: 9993, profit: 100000),
TopModel(position: 10, country: "korea", name: "Jack", deposit: 5555, profit: 15000),
]
