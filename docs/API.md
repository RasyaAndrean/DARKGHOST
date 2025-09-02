# DarkGhost API Documentation

## Overview

The DarkGhost API provides programmatic access to node functionality, wallet operations, and blockchain data. This documentation covers the JSON-RPC API available for interacting with DarkGhost nodes.

## API Access

### Endpoint

```
http://localhost:31314/json_rpc
```

### Authentication

API access requires RPC authentication:

```ini
# darkghost.conf
rpc-login=username:password
```

### Example Request

```bash
curl -u username:password -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":"0","method":"get_info"}' \
  http://localhost:31314/json_rpc
```

## Core Methods

### get_info

Returns general information about the node and blockchain.

**Parameters**: None

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "version": "1.0.0",
    "height": 12345,
    "target_height": 12345,
    "difficulty": 1000000,
    "target": 120,
    "tx_count": 56789,
    "tx_pool_size": 12,
    "alt_blocks_count": 0,
    "outgoing_connections_count": 8,
    "incoming_connections_count": 5,
    "rpc_connections_count": 1,
    "white_peerlist_size": 100,
    "grey_peerlist_size": 50,
    "mainnet": true,
    "testnet": false,
    "stagenet": false,
    "nettype": "mainnet",
    "cumulative_difficulty": 123456789012345,
    "block_size_limit": 1048576,
    "block_size_median": 524288,
    "start_time": 1756742400
  }
}
```

### get_height

Returns the current blockchain height.

**Parameters**: None

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "height": 12345
  }
}
```

### get_block_hash

Returns the block hash at a given height.

**Parameters**:

```json
{
  "height": 12345
}
```

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "block_hash": "a1b2c3d4e5f6..."
  }
}
```

### get_block

Returns detailed information about a block.

**Parameters**:

```json
{
  "hash": "a1b2c3d4e5f6...",
  "height": 12345
}
```

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "block_header": {
      "height": 12345,
      "hash": "a1b2c3d4e5f6...",
      "timestamp": 1756742400,
      "prev_hash": "f6e5d4c3b2a1...",
      "nonce": 123456789,
      "miner_tx_hash": "9f8e7d6c5b4a...",
      "difficulty": 1000000,
      "reward": 5000000000,
      "block_size": 10240,
      "tx_hashes": ["tx1...", "tx2...", "tx3..."]
    }
  }
}
```

## Transaction Methods

### get_transactions

Returns information about transactions.

**Parameters**:

```json
{
  "tx_hashes": ["tx1...", "tx2..."]
}
```

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "txs": [
      {
        "tx_hash": "tx1...",
        "tx_json": "{...}",
        "block_height": 12345,
        "block_timestamp": 1756742400
      }
    ],
    "txs_as_hex": ["hex1...", "hex2..."],
    "missed_tx": []
  }
}
```

### send_raw_transaction

Submits a raw transaction to the network.

**Parameters**:

```json
{
  "tx_as_hex": "0x...",
  "do_not_relay": false
}
```

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "tx_hash": "tx1...",
    "tx_blob": "0x...",
    "status": "OK"
  }
}
```

### start_mining

Starts mining on the node.

**Parameters**:

```json
{
  "miner_address": "DG1YourMiningAddressHere",
  "threads_count": 4,
  "do_background_mining": false,
  "ignore_battery": false
}
```

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "status": "OK"
  }
}
```

### stop_mining

Stops mining on the node.

**Parameters**: None

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "status": "OK"
  }
}
```

## Wallet Methods

### create_wallet

Creates a new wallet.

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
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "seed": "sequence of 25 words",
    "address": "DG1WalletAddressHere",
    "status": "OK"
  }
}
```

### open_wallet

Opens an existing wallet.

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
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "address": "DG1WalletAddressHere",
    "status": "OK"
  }
}
```

### close_wallet

Closes the currently open wallet.

**Parameters**: None

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "status": "OK"
  }
}
```

### get_balance

Returns the wallet's balance.

**Parameters**: None

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "balance": 1000000000000,
    "unlocked_balance": 500000000000,
    "multisig_import_needed": false,
    "status": "OK"
  }
}
```

### get_address

Returns the wallet's address.

**Parameters**: None

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "address": "DG1WalletAddressHere",
    "status": "OK"
  }
}
```

### transfer

Sends DG to a specified address.

**Parameters**:

```json
{
  "destinations": [
    {
      "amount": 10000000000,
      "address": "DG1RecipientAddressHere"
    }
  ],
  "priority": 2,
  "ring_size": 11,
  "unlock_time": 0,
  "payment_id": "",
  "get_tx_key": true
}
```

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "tx_hash": "tx1...",
    "tx_key": "key1...",
    "amount": 10000000000,
    "fee": 10000000,
    "tx_blob": "0x...",
    "tx_metadata": "metadata...",
    "multisig_txset": "",
    "unsigned_txset": "",
    "status": "OK"
  }
}
```

### get_transfers

Returns the wallet's transaction history.

**Parameters**:

```json
{
  "in": true,
  "out": true,
  "pending": true,
  "failed": true,
  "pool": true
}
```

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "in": [
      {
        "txid": "tx1...",
        "payment_id": "",
        "height": 12345,
        "timestamp": 1756742400,
        "amount": 10000000000,
        "fee": 0,
        "address": "DG1WalletAddressHere",
        "confirmations": 10
      }
    ],
    "out": [
      {
        "txid": "tx2...",
        "payment_id": "",
        "height": 12340,
        "timestamp": 1756740000,
        "amount": 5000000000,
        "fee": 10000000,
        "address": "DG1RecipientAddressHere",
        "confirmations": 15
      }
    ]
  }
}
```

## Network Methods

### get_connections

Returns information about the node's connections.

**Parameters**: None

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "connections": [
      {
        "incoming": true,
        "ip": "192.168.1.100",
        "port": 31313,
        "peer_id": "peer1...",
        "recv_count": 100,
        "recv_idle_time": 5,
        "send_count": 50,
        "send_idle_time": 10,
        "state": "state_normal",
        "live_time": 3600,
        "avg_download": 1024,
        "current_download": 512,
        "avg_upload": 512,
        "current_upload": 256
      }
    ]
  }
}
```

### get_peer_list

Returns the node's peer list.

**Parameters**: None

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "white_list": [
      {
        "host": "192.168.1.100",
        "port": 31313,
        "last_seen": 1756742400
      }
    ],
    "gray_list": [
      {
        "host": "192.168.1.101",
        "port": 31313,
        "last_seen": 1756740000
      }
    ]
  }
}
```

## Utility Methods

### validate_address

Validates a DarkGhost address.

**Parameters**:

```json
{
  "address": "DG1WalletAddressHere",
  "any_net_type": false,
  "allow_openalias": false
}
```

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "valid": true,
    "integrated": false,
    "subaddress": false,
    "nettype": "mainnet",
    "status": "OK"
  }
}
```

### get_version

Returns the node's version information.

**Parameters**: None

**Response**:

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "result": {
    "version": 1000000,
    "release": "1.0.0",
    "status": "OK"
  }
}
```

## Error Handling

### Common Error Codes

| Code   | Message          | Description                                       |
| ------ | ---------------- | ------------------------------------------------- |
| -1     | Parse error      | Invalid JSON was received                         |
| -32600 | Invalid Request  | The JSON sent is not a valid Request object       |
| -32601 | Method not found | The method does not exist                         |
| -32602 | Invalid params   | Invalid method parameter(s)                       |
| -32603 | Internal error   | Internal JSON-RPC error                           |
| -32700 | Server error     | Reserved for implementation-defined server-errors |

### Example Error Response

```json
{
  "jsonrpc": "2.0",
  "id": "0",
  "error": {
    "code": -32601,
    "message": "Method not found"
  }
}
```

## JavaScript Example

```javascript
const DarkGhostAPI = {
  url: 'http://localhost:31314/json_rpc',
  username: 'rpc_user',
  password: 'rpc_password',

  async call(method, params = {}) {
    const response = await fetch(this.url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Basic ' + btoa(this.username + ':' + this.password),
      },
      body: JSON.stringify({
        jsonrpc: '2.0',
        id: '0',
        method: method,
        params: params,
      }),
    });

    return await response.json();
  },

  async getBalance() {
    return await this.call('get_balance');
  },

  async getTransactions() {
    return await this.call('get_transfers', {
      in: true,
      out: true,
    });
  },

  async sendTransaction(address, amount) {
    return await this.call('transfer', {
      destinations: [
        {
          amount: amount,
          address: address,
        },
      ],
      priority: 2,
      ring_size: 11,
    });
  },
};

// Usage
DarkGhostAPI.getBalance().then(result => {
  console.log('Balance:', result.result.balance);
});
```

## Python Example

```python
import requests
import json

class DarkGhostAPI:
    def __init__(self, url='http://localhost:31314/json_rpc',
                 username='rpc_user', password='rpc_password'):
        self.url = url
        self.auth = (username, password)
        self.headers = {'content-type': 'application/json'}

    def call(self, method, params=None):
        payload = {
            "jsonrpc": "2.0",
            "id": "0",
            "method": method
        }

        if params:
            payload["params"] = params

        response = requests.post(
            self.url,
            data=json.dumps(payload),
            headers=self.headers,
            auth=self.auth
        )

        return response.json()

    def get_info(self):
        return self.call('get_info')

    def get_balance(self):
        return self.call('get_balance')

    def transfer(self, address, amount):
        params = {
            'destinations': [{
                'amount': amount,
                'address': address
            }],
            'priority': 2,
            'ring_size': 11
        }
        return self.call('transfer', params)

# Usage
api = DarkGhostAPI()
info = api.get_info()
print(f"Blockchain height: {info['result']['height']}")
```

## Security Considerations

### RPC Security

1. **Authentication**: Always use strong RPC credentials
2. **Network Security**: Restrict RPC access to trusted sources
3. **Encryption**: Use HTTPS/TLS for remote connections
4. **Firewall**: Configure firewall rules to limit access

### Best Practices

1. **Rate Limiting**: Implement rate limiting to prevent abuse
2. **Input Validation**: Validate all API inputs
3. **Error Handling**: Don't expose sensitive information in error messages
4. **Logging**: Log API access for security monitoring

## API Versions

### Version 1.0 (Current)

- Core blockchain methods
- Wallet functionality
- Network information
- Transaction processing

### Future Versions

- Smart contract support
- Enhanced privacy features
- Improved performance APIs
- Additional utility methods

## Troubleshooting

### Common Issues

1. **Connection Refused**

   - Check if the node is running
   - Verify RPC port configuration
   - Check firewall settings

2. **Authentication Failed**

   - Verify RPC credentials
   - Check configuration file
   - Ensure proper permissions

3. **Method Not Found**
   - Verify API method name
   - Check node version compatibility
   - Review documentation

### Debugging Tips

1. **Enable Debug Logging**

   ```ini
   # darkghost.conf
   log-level=4
   ```

2. **Test with curl**

   ```bash
   curl -u user:pass -H "Content-Type: application/json" \
     -d '{"jsonrpc":"2.0","id":"0","method":"get_info"}' \
     http://localhost:31314/json_rpc
   ```

3. **Check Node Status**
   ```bash
   ./darkghost-cli status
   ```

## Support

For API-related questions and support:

- **Documentation**: https://docs.darkghost.network/api
- **GitHub Issues**: https://github.com/darkghost-network/darkghost-core/issues
- **Discord**: discord.gg/darkghost
- **Email**: api-support@darkghost.network

The DarkGhost API is designed to be intuitive and powerful, enabling developers to build applications that interact with the DarkGhost network while maintaining the privacy and security that are core to the project's mission.
