//
//  SKProductsManager+PurchasedSK2Transaction.swift
//  AdaptySDK
//
//  Created by Aleksei Valiano on 01.06.2023
//

import StoreKit

@available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
extension SKProductsManager {
    func fillPurchasedTransaction(variationId: String?,
                                  persistentVariationId: String? = nil,
                                  purchasedSK2Transaction transaction: SK2Transaction,
                                  _ completion: @escaping (PurchasedTransaction) -> Void) {
        let productId = transaction.productID

        fetchSK2Product(productIdentifier: productId, fetchPolicy: .returnCacheDataElseLoad) { result in
            if let error = result.error {
                Log.error("SK1QueueManager: fetch SK2Product \(productId) error: \(error)")
            }
            completion(PurchasedTransaction(
                sk2Product: try? result.get(),
                variationId: variationId,
                persistentVariationId: persistentVariationId,
                purchasedSK2Transaction: transaction
            ))
        }
    }
}

@available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
private extension PurchasedTransaction {
    init(
        sk2Product: SK2Product?,
        variationId: String?,
        persistentVariationId: String?,
        purchasedSK2Transaction transaction: Transaction
    ) {
        let offer = PurchasedTransaction.SubscriptionOffer(transaction, sk2Product: sk2Product)

        self.init(
            transactionId: transaction.transactionIdentifier,
            originalTransactionId: transaction.originalTransactionIdentifier,
            vendorProductId: transaction.productID,
            productVariationId: variationId,
            persistentProductVariationId: persistentVariationId,
            price: sk2Product?.price,
            priceLocale: sk2Product?.priceFormatStyle.locale.a_currencyCode,
            storeCountry: sk2Product?.priceFormatStyle.locale.regionCode,
            subscriptionOffer: offer,
            environment: transaction.environmentString
        )
    }
}

@available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
private extension PurchasedTransaction.SubscriptionOffer {
    init?(_ transaction: SK2Transaction, sk2Product: SK2Product?) {
        guard let offerType = transaction.offerType else { return nil }
        let productOffer = sk2Product?.subscriptionOffer(byType: offerType, withId: transaction.offerID)
        self = .init(
            id: transaction.offerID,
            period: (productOffer?.period).map { AdaptyProductSubscriptionPeriod(subscriptionPeriod: $0) },
            paymentMode: (productOffer?.paymentMode).map { .init(mode: $0) } ?? .unknown,
            type: .init(type: offerType),
            price: productOffer?.price
        )
    }
}

@available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
private extension SK2Product {
    func subscriptionOffer(
        byType offerType: SK2Transaction.OfferType,
        withId offerId: String?
    ) -> SK2Product.SubscriptionOffer? {
        guard let subscription = subscription else { return nil }

        switch offerType {
        case .introductory:
            return subscription.introductoryOffer
        case .promotional:
            if let offerId = offerId {
                return subscription.promotionalOffers.first(where: { $0.id == offerId })
            }
        default:
            return nil
        }
        return nil
    }
}
