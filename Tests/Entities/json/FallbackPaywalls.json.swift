//
//  FallbackPaywalls.json.swift
//  AdaptyTests
//
//  Created by Aleksei Valiano on 22.11.2022
//

@testable import Adapty

extension FallbackPaywalls {
    enum ValidJSON {
        static let all = [full, example]

        static let full: JSONValue = ["data": .array(AdaptyPaywall.ValidJSON.all.map {
            JSONValue.object(["type": "adapty_inapps_fallback_paywalls",
                              "attributes": $0])
        }),
        "meta": ["version": 1, "products": .array(AdaptyPaywall.ProductReference.ValidJSON.all)]]

        static let example: JSONValue = [
            "data": [
                [
                    "type": "adapty_inapps_fallback_paywalls",
                    "id": "1def6168-fdfc-43de-add4-4319e3dd081e",
                    "attributes": [
                        "developer_id": "onboarding_paywall",
                        "paywall_id": "onboarding_paywall.paywall_id",
                        "revision": 4,
                        "variation_id": "7de7f227-9a0e-4c95-8c60-ab6768cd3caf",
                        "ab_test_name": "Onboarding paywall",
                        "paywall_name": "Onboarding paywall",
                        "paywall_updated_at": 1626172581420,
                        "products": [
                            [
                                "title": "Monthly Premium",
                                "vendor_product_id": "monthly.premium.999",
                                "adapty_product_id": "monthly.premium.999",
                                "promotional_offer_id": .null,
                                "introductory_offer_eligibility": false,
                                "promotional_offer_eligibility": false,
                                "timestamp": 1666278245947,
                            ],
                            [
                                "title": "Weekly Premium",
                                "vendor_product_id": "weekly.premium.599",
                                "adapty_product_id": "weekly.premium.599",
                                "promotional_offer_id": .null,
                                "introductory_offer_eligibility": false,
                                "promotional_offer_eligibility": false,
                                "timestamp": 1666278245947,
                            ],
                            [
                                "title": "Yearly Premium",
                                "vendor_product_id": "yearly.premium.6999",
                                "adapty_product_id": "yearly.premium.6999",
                                "promotional_offer_id": .null,
                                "introductory_offer_eligibility": false,
                                "promotional_offer_eligibility": false,
                                "timestamp": 1666278245947,
                            ],
                        ],
                        "is_promo": false,
                        "visual_paywall": .null,
                        "custom_payload": .null,
                    ],
                ],
                [
                    "type": "adapty_inapps_fallback_paywalls",
                    "id": "749b9e57-15b4-4a04-a069-169751cdf41c",
                    "attributes": [
                        "developer_id": "example_ab_test",
                        "paywall_id": "example_ab_test.paywall_id",
                        "revision": 16,
                        "variation_id": "3443ba5c-5da6-494c-8e58-88b6fb99dd27",
                        "ab_test_name": "A/B Test For Example",
                        "paywall_name": "Three products",
                        "paywall_updated_at": 1663692083411,
                        "products": [
                            [
                                "title": "Weekly Premium",
                                "vendor_product_id": "weekly.premium.599",
                                "adapty_product_id": "weekly.premium.599",
                                "promotional_offer_id": .null,
                                "introductory_offer_eligibility": false,
                                "promotional_offer_eligibility": false,
                                "timestamp": 1666278245959,
                            ],
                            [
                                "title": "Monthly Premium",
                                "vendor_product_id": "monthly.premium.999",
                                "adapty_product_id": "monthly.premium.999",
                                "promotional_offer_id": .null,
                                "introductory_offer_eligibility": false,
                                "promotional_offer_eligibility": false,
                                "timestamp": 1666278245959,
                            ],
                            [
                                "title": "Yearly Premium",
                                "vendor_product_id": "yearly.premium.6999",
                                "adapty_product_id": "yearly.premium.6999",
                                "promotional_offer_id": "promo50off",
                                "introductory_offer_eligibility": false,
                                "promotional_offer_eligibility": false,
                                "timestamp": 1666278245959,
                            ],
                        ],
                        "is_promo": false,
                        "visual_paywall": .null,
                        "custom_payload": "{\"is_horizontal\":true,\"title\":\"Meet Three Subscription:\",\"subtitle\":\"• point 1\\n• point 2\\n• point 3\"}",
                    ],
                ],
                [
                    "type": "adapty_inapps_fallback_paywalls",
                    "id": "f523541c-4d65-403c-8f63-91ce9bcbde60",
                    "attributes": [
                        "developer_id": "davyd",
                        "paywall_id": "davyd.paywall_id",
                        "revision": 2,
                        "variation_id": "80dc9b38-62a4-4c71-806b-c586afee4b3b",
                        "ab_test_name": "Davyd test",
                        "paywall_name": "Davyd test",
                        "paywall_updated_at": 1629195056382,
                        "products": [
                            [
                                "title": "Yearly Premium",
                                "vendor_product_id": "yearly.premium.6999",
                                "adapty_product_id": "yearly.premium.6999",
                                "promotional_offer_id": "promo50off",
                                "introductory_offer_eligibility": false,
                                "promotional_offer_eligibility": false,
                                "timestamp": 1666278245970,
                            ],
                        ],
                        "is_promo": false,
                        "visual_paywall": .null,
                        "custom_payload": .null,
                    ],
                ],
                [
                    "type": "adapty_inapps_fallback_paywalls",
                    "id": "92e6510c-ee90-4eff-b5d7-21bdd3deeb79",
                    "attributes": [
                        "developer_id": "onboarding_unlim",
                        "paywall_id": "onboarding_unlim.paywall_id",
                        "revision": 1,
                        "variation_id": "c5a2c049-2ff5-49cb-8fc1-44e4a6e2a135",
                        "ab_test_name": "Unlimited Paywall",
                        "paywall_name": "Unlimited Paywall",
                        "paywall_updated_at": 1664549322399,
                        "products": [
                            [
                                "title": "Unlimited",
                                "vendor_product_id": "unlimited.9999",
                                "adapty_product_id": "unlimited.9999",
                                "promotional_offer_id": .null,
                                "introductory_offer_eligibility": false,
                                "promotional_offer_eligibility": false,
                                "timestamp": 1666278245977,
                            ],
                        ],
                        "is_promo": false,
                        "visual_paywall": .null,
                        "custom_payload": .null],
                ],
            ],
            "meta": [
                "version": 1,
                "products": [
                    ["vendor_product_id": "yearly.premium.6999"],
                    ["vendor_product_id": "consumable_apples_99"],
                    ["vendor_product_id": "unlimited.9999"],
                    ["vendor_product_id": "monthly.premium.999"],
                    ["vendor_product_id": "weekly.premium.599"],
                ],
            ],
        ]
    }
}
