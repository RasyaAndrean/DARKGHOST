# DarkGhost API Documentation

This document describes the DarkGhost API, including JSON-RPC methods, REST endpoints, and WebSocket interfaces.

## Overview

DarkGhost provides multiple API interfaces for interacting with the network:

- **JSON-RPC**: Traditional JSON-RPC interface
- **REST**: HTTP-based RESTful API
- **WebSocket**: Real-time event notifications
- **Library Bindings**: Native libraries for various languages

## JSON-RPC API

### Connection

The JSON-RPC API is available at:

- **Mainnet**: `http://127.0.0.1:18081/json_rpc`
- **Testnet**: `http://127.0.0.1:28081/json_rpc`
- **Devnet**: `http://127.0.0.1:38081/json_rpc`

### Authentication

RPC authentication can be enabled with:

```bash
./darkghostd --rpc-login username:password
```

### Common Methods

#### get_info

Get general information about the node and network.

**Parameters**: None

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "height": 12345,
    "target_height": 12345,
    "difficulty": 123456789,
    "target": 120,
    "tx_count": 123456,
    "tx_pool_size": 10,
    "alt_blocks_count": 0,
    "outgoing_connections_count": 8,
    "incoming_connections_count": 5,
    "rpc_connections_count": 1,
    "white_peerlist_size": 500,
    "grey_peerlist_size": 100,
    "mainnet": true,
    "testnet": false,
    "devnet": false,
    "nettype": "mainnet",
    "top_block_hash": "abc123...",
    "cumulative_difficulty": 123456789012345,
    "block_size_limit": 20000,
    "block_size_median": 15000,
    "status": "OK"
  }
}
```

#### get_block_count

Get the current block count.

**Parameters**: None

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "count": 12345,
    "status": "OK"
  }
}
```

#### get_block_hash

Get the block hash at a specific height.

**Parameters**:

```json
{
  "height": 12345
}
```

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "hash": "abc123...",
    "status": "OK"
  }
}
```

#### get_block_template

Get a block template for mining.

**Parameters**:

```json
{
  "wallet_address": "dg1abc123...",
  "reserve_size": 16
}
```

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "blocktemplate_blob": "0100...",
    "blockhashing_blob": "0100...",
    "difficulty": 123456789,
    "expected_reward": 5000000000,
    "height": 12345,
    "prev_hash": "def456...",
    "reserved_offset": 128,
    "status": "OK"
  }
}
```

#### submit_block

Submit a mined block to the network.

**Parameters**:

```json
["0100..."]
```

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "status": "OK"
  }
}
```

#### get_transactions

Get transaction information.

**Parameters**:

```json
{
  "txs_hashes": ["abc123...", "def456..."]
}
```

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "txs_as_hex": ["0100..."],
    "txs_as_json": ["{\"version\":1,...}"],
    "tx_hashes": ["abc123..."],
    "status": "OK"
  }
}
```

#### send_raw_transaction

Broadcast a raw transaction to the network.

**Parameters**:

```json
{
  "tx_as_hex": "0100...",
  "do_not_relay": false
}
```

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "tx_hash": "abc123...",
    "status": "OK"
  }
}
```

### Wallet Methods

#### create_wallet

Create a new wallet.

**Parameters**:

```json
{
  "filename": "my_wallet",
  "password": "secure_password",
  "language": "English"
}
```

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "address": "dg1abc123...",
    "seed": "sequence of words...",
    "status": "OK"
  }
}
```

#### open_wallet

Open an existing wallet.

**Parameters**:

```json
{
  "filename": "my_wallet",
  "password": "secure_password"
}
```

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "address": "dg1abc123...",
    "status": "OK"
  }
}
```

#### close_wallet

Close the currently open wallet.

**Parameters**: None

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "status": "OK"
  }
}
```

#### get_balance

Get the wallet balance.

**Parameters**: None

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "balance": 100000000000,
    "unlocked_balance": 50000000000,
    "status": "OK"
  }
}
```

#### get_address

Get the wallet address.

**Parameters**: None

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "address": "dg1abc123...",
    "status": "OK"
  }
}
```

#### transfer

Send a transaction.

**Parameters**:

```json
{
  "destinations": [
    {
      "amount": 1000000000,
      "address": "dg1def456..."
    }
  ],
  "mixin": 10,
  "unlock_time": 0,
  "payment_id": ""
}
```

**Response**:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "result": {
    "tx_hash": "abc123...",
    "tx_key": "def456...",
    "amount": 1000000000,
    "fee": 10000,
    "status": "OK"
  }
}
```

## REST API

### Base URL

The REST API is available at:

- **Mainnet**: `http://127.0.0.1:18081`
- **Testnet**: `http://127.0.0.1:28081`
- **Devnet**: `http://127.0.0.1:38081`

### Endpoints

#### GET /block/count

Get the current block count.

**Response**:

```json
{
  "count": 12345,
  "status": "success"
}
```

#### GET /block/{height}

Get block information by height.

**Response**:

```json
{
  "block": {
    "height": 12345,
    "hash": "abc123...",
    "timestamp": 1234567890,
    "difficulty": 123456789,
    "tx_count": 5,
    "size": 15000
  },
  "status": "success"
}
```

#### GET /transaction/{hash}

Get transaction information by hash.

**Response**:

```json
{
  "transaction": {
    "hash": "abc123...",
    "amount": 1000000000,
    "fee": 10000,
    "size": 2000,
    "confirmations": 10
  },
  "status": "success"
}
```

#### GET /address/{address}

Get address information.

**Response**:

```json
{
  "address": "dg1abc123...",
  "balance": 100000000000,
  "tx_count": 25,
  "received": 200000000000
}
```

#### POST /transaction/send

Send a transaction.

**Request**:

```json
{
  "destinations": [
    {
      "amount": 1000000000,
      "address": "dg1def456..."
    }
  ],
  "mixin": 10
}
```

**Response**:

```json
{
  "tx_hash": "abc123...",
  "status": "success"
}
```

## WebSocket API

### Connection

WebSocket connections are available at:

- **Mainnet**: `ws://127.0.0.1:18082`
- **Testnet**: `ws://127.0.0.1:28082`
- **Devnet**: `ws://127.0.0.1:38082`

### Events

#### new_block

Emitted when a new block is added to the blockchain.

**Data**:

```json
{
  "height": 12345,
  "hash": "abc123...",
  "timestamp": 1234567890,
  "difficulty": 123456789,
  "tx_count": 5
}
```

#### new_transaction

Emitted when a new transaction is received.

**Data**:

```json
{
  "hash": "abc123...",
  "amount": 1000000000,
  "fee": 10000
}
```

#### mempool_update

Emitted when the mempool is updated.

**Data**:

```json
{
  "tx_count": 10,
  "total_fee": 100000
}
```

### Subscription

Subscribe to events:

```javascript
const ws = new WebSocket('ws://127.0.0.1:18082');

ws.onopen = function () {
  // Subscribe to new blocks
  ws.send(
    JSON.stringify({
      method: 'subscribe',
      params: ['new_block'],
    })
  );
};

ws.onmessage = function (event) {
  const data = JSON.parse(event.data);
  console.log('Received:', data);
};
```

## Library Bindings

### C++ Library

```cpp
#include "darkghost/api.h"

DarkGhost::Client client("127.0.0.1", 18081);

auto info = client.getInfo();
std::cout << "Block height: " << info.height << std::endl;

auto balance = client.getBalance();
std::cout << "Balance: " << balance.balance << std::endl;
```

### Python Library

```python
from darkghost import Client

client = Client("127.0.0.1", 18081)

info = client.get_info()
print(f"Block height: {info['height']}")

balance = client.get_balance()
print(f"Balance: {balance['balance']}")
```

### JavaScript Library

```javascript
const DarkGhost = require('darkghost-js');

const client = new DarkGhost.Client('127.0.0.1', 18081);

client.getInfo().then(info => {
  console.log(`Block height: ${info.height}`);
});

client.getBalance().then(balance => {
  console.log(`Balance: ${balance.balance}`);
});
```

## Error Handling

### JSON-RPC Errors

JSON-RPC errors follow the standard format:

```json
{
  "id": "0",
  "jsonrpc": "2.0",
  "error": {
    "code": -1,
    "message": "Error message"
  }
}
```

### Common Error Codes

- **-1**: General error
- **-2**: Invalid parameters
- **-3**: Not found
- **-4**: Insufficient funds
- **-5**: Transaction rejected
- **-6**: Network error

### REST API Errors

REST API errors return appropriate HTTP status codes:

- **400**: Bad request
- **401**: Unauthorized
- **404**: Not found
- **500**: Internal server error

## Rate Limiting

### Limits

API requests are rate-limited to prevent abuse:

- **JSON-RPC**: 100 requests per minute per IP
- **REST**: 200 requests per minute per IP
- **WebSocket**: 10 concurrent connections per IP

### Headers

Rate limit information is provided in response headers:

```
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95
X-RateLimit-Reset: 1234567890
```

## Authentication

### RPC Authentication

Enable RPC authentication with:

```bash
./darkghostd --rpc-login username:password
```

### Wallet Authentication

Wallet authentication is handled through wallet files and passwords.

### API Keys

For third-party services, API keys can be used:

```bash
./darkghostd --api-key abc123def456
```

## Examples

### Node Status Check

```bash
curl -X POST http://127.0.0.1:18081/json_rpc \
  -H 'Content-Type: application/json' \
  -d '{
    "jsonrpc": "2.0",
    "id": "0",
    "method": "get_info"
  }'
```

### Wallet Balance Check

```bash
curl -X POST http://127.0.0.1:18081/json_rpc \
  -H 'Content-Type: application/json' \
  -d '{
    "jsonrpc": "2.0",
    "id": "0",
    "method": "get_balance"
  }'
```

### Transaction Sending

```bash
curl -X POST http://127.0.0.1:18081/json_rpc \
  -H 'Content-Type: application/json' \
  -d '{
    "jsonrpc": "2.0",
    "id": "0",
    "method": "transfer",
    "params": {
      "destinations": [{
        "amount": 1000000000,
        "address": "dg1abc123..."
      }],
      "mixin": 10
    }
  }'
```

## Security Considerations

### Transport Security

- **HTTPS**: Use HTTPS for production deployments
- **TLS**: Enable TLS for RPC connections
- **Certificates**: Use valid SSL certificates

### Authentication Security

- **Strong Passwords**: Use strong RPC passwords
- **API Keys**: Rotate API keys regularly
- **IP Whitelisting**: Restrict access by IP address

### Input Validation

- **Sanitization**: Validate all API inputs
- **Rate Limiting**: Implement rate limiting
- **DDoS Protection**: Protect against DDoS attacks

## Performance Optimization

### Caching

- **Block Data**: Cache frequently accessed block data
- **Transaction Data**: Cache transaction information
- **Address Data**: Cache address balances and history

### Connection Pooling

- **Database**: Use connection pooling for database access
- **Network**: Reuse network connections
- **RPC**: Maintain persistent RPC connections

### Compression

- **Response Compression**: Enable gzip compression
- **WebSocket**: Use compression for WebSocket messages
- **Data Transfer**: Optimize data transfer sizes

## Versioning

### API Versioning

API versions are indicated in the URL:

- **v1**: `/api/v1/`
- **v2**: `/api/v2/`

### Backward Compatibility

- **Minor Versions**: Maintain backward compatibility
- **Major Versions**: Breaking changes in major versions
- **Deprecation**: Deprecate features with advance notice

## Troubleshooting

### Common Issues

#### Connection Refused

```
curl: (7) Failed to connect to 127.0.0.1 port 18081: Connection refused
```

**Solution**: Ensure the DarkGhost node is running and listening on the correct port.

#### Authentication Required

```json
{
  "error": {
    "code": -1,
    "message": "Unauthorized"
  }
}
```

**Solution**: Provide valid authentication credentials.

#### Rate Limit Exceeded

```
429 Too Many Requests
```

**Solution**: Reduce request frequency or implement exponential backoff.

### Debugging

Enable debug logging:

```bash
./darkghostd --log-level debug
```

## Resources

### Documentation

- [JSON-RPC Specification](https://www.jsonrpc.org/specification)
- [RESTful API Design](https://restfulapi.net/)
- [WebSocket Protocol](https://tools.ietf.org/html/rfc6455)

### Tools

- [Postman](https://www.postman.com/) - API testing
- [curl](https://curl.se/) - Command-line HTTP client
- [WebSocket Client](https://www.websocket.org/echo.html) - WebSocket testing

### Libraries

- [json-rpc](https://github.com/json-rpc) - JSON-RPC libraries
- [axios](https://github.com/axios/axios) - Promise-based HTTP client
- [ws](https://github.com/websockets/ws) - WebSocket library

## Last Updated

September 2, 2025

---
