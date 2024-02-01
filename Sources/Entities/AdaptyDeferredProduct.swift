//
//  AdaptyDeferredProduct.swift
//  Adapty
//
//  Created by Aleksei Valiano on 20.10.2022.
//

import StoreKit

public struct AdaptyDeferredProduct: AdaptyProduct {
    /// An identifier of a promotional offer, provided by Adapty for this specific user.
    public let promotionalOfferId: String?

    /// Underlying system representation of the product.
    public let skProduct: SKProduct
}

extension AdaptyDeferredProduct: CustomStringConvertible {
    public var description: String {
        "(vendorProductId: \(vendorProductId)"
            + (promotionalOfferId.map { ", promotionalOfferId: \($0)" } ?? "")
            + ", skProduct: \(skProduct))"
    }
}

extension AdaptyDeferredProduct {
    init(skProduct: SKProduct, payment: SKPayment?) {
        self.init(
            promotionalOfferId: payment?.paymentDiscount?.identifier,
            skProduct: skProduct
        )
    }
}
