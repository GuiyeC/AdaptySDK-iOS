//
//  FetchAllProductVendorIdsRequest.swift
//  Adapty
//
//  Created by Aleksei Valiano on 23.09.2022.
//

import Foundation

struct FetchAllProductVendorIdsRequest: HTTPRequestWithDecodableResponse {
    typealias ResponseBody = Backend.Response.Body<[String]?>
    let endpoint = HTTPEndpoint(
        method: .get,
        path: "/sdk/in-apps/products-ids/"
    )
    let headers: Headers

    func getDecoder(_ jsonDecoder: JSONDecoder) -> ((HTTPDataResponse) -> HTTPResponse<ResponseBody>.Result) {
        { response in
            let result: Result<[String]?, Error>

            if headers.hasSameBackendResponseHash(response.headers) {
                result = .success(nil)
            } else {
                result = jsonDecoder.decode(Backend.Response.ValueOfData<[String]>.self, response.body).map { $0.value }
            }
            return result.map { response.replaceBody(Backend.Response.Body($0)) }
                .mapError { .decoding(response, error: $0) }
        }
    }

    init(profileId: String, responseHash: String?) {
        headers = Headers()
            .setBackendProfileId(profileId)
            .setBackendResponseHash(responseHash)
    }
}

extension HTTPSession {
    func performFetchAllProductVendorIdsRequest(profileId: String,
                                                responseHash: String?,
                                                _ completion: @escaping (Result<VH<[String]?>, HTTPError>) -> Void
) {
        let request = FetchAllProductVendorIdsRequest(profileId: profileId,
                                                      responseHash: responseHash)

        //TODO: fetch_products_ids event
        let stamp = Log.stamp
        Adapty.logSystemEvent(AdaptyBackendAPIRequestParameters(methodName: "fetch_products_ids", callId: stamp))
        perform(request, logStamp: stamp) { (result: FetchAllProductVendorIdsRequest.Result) in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(response):
                completion(.success(VH(response.body.value, hash: response.headers.getBackendResponseHash())))
            }
        }
    }
}
