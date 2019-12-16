## Lambda

> NOTE: This subdirectory has not yet been made bazel-aware and exists for future integration.

### Event Argument to the Handler

#### Through the API Gateway

```ruby
{
  "message": "Hello from Lambda!",
  "version": 2,
  "path": "/default/hello-world",
  "httpMethod": "GET",
  "headers": {
    "Content-Length": "0",
    "Host": "xxxxxxxxxx.execute-api.us-west-2.amazonaws.com",
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36",
    "X-Amzn-Trace-Id": "Root=SomethingVerySecret",
    "X-Forwarded-For": "124.124.124.124",
    "X-Forwarded-Port": "443",
    "X-Forwarded-Proto": "https",
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3",
    "accept-encoding": "gzip, deflate, br",
    "accept-language": "en-US,en;q=0.9",
    "sec-fetch-mode": "navigate",
    "sec-fetch-site": "none",
    "sec-fetch-user": "?1",
    "upgrade-insecure-requests": "1"
  },
  "multiValueHeaders": {
    "Content-Length": [
      "0"
    ],
    "Host": [
      "xxxxxxxxxx.execute-api.us-west-2.amazonaws.com"
    ],
    "User-Agent": [
      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36"
    ],
    "X-Amzn-Trace-Id": [
      "Root=SomethingVerySecret"
    ],
    "X-Forwarded-For": [
      "207.141.66.96"
    ],
    "X-Forwarded-Port": [
      "443"
    ],
    "X-Forwarded-Proto": [
      "https"
    ],
    "accept": [
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3"
    ],
    "accept-encoding": [
      "gzip, deflate, br"
    ],
    "accept-language": [
      "en-US,en;q=0.9"
    ],
    "sec-fetch-mode": [
      "navigate"
    ],
    "sec-fetch-site": [
      "none"
    ],
    "sec-fetch-user": [
      "?1"
    ],
    "upgrade-insecure-requests": [
      "1"
    ]
  },
  "queryStringParameters": {
    "query": "search"
  },
  "multiValueQueryStringParameters": {
    "query": [
      "search"
    ]
  },
  "requestContext": {
    "accountId": "00000000000",
    "apiId": "xxxxxxxxxx",
    "authorizer": {
      "claims": null,
      "scopes": null
    },
    "domainName": "xxxxxxxxxx.execute-api.us-west-2.amazonaws.com",
    "domainPrefix": "xxxxxxxxxx",
    "extendedRequestId": null,
    "httpMethod": "GET",
    "identity": {
      "accessKey": null,
      "accountId": null,
      "caller": null,
      "cognitoAuthenticationProvider": null,
      "cognitoAuthenticationType": null,
      "cognitoIdentityId": null,
      "cognitoIdentityPoolId": null,
      "principalOrgId": null,
      "sourceIp": "207.141.66.96",
      "user": null,
      "userAgent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36",
      "userArn": null
    },
    "path": "/default/hello-world",
    "protocol": "HTTP/1.1",
    "requestId": null,
    "requestTime": "06/Dec/2019:23:29:29 +0000",
    "requestTimeEpoch": 1575674969429,
    "resourceId": null,
    "resourcePath": "/hello-world",
    "stage": "default"
  },
  "pathParameters": null,
  "stageVariables": null,
  "body": null,
  "isBase64Encoded": true
}
```
