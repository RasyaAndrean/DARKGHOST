# DarkGhost Devnet Explorer

This is a blockchain explorer for the DarkGhost devnet, forked from xmrchain.net.

## Overview

The explorer provides a web interface to browse blocks, transactions, and other data on the DarkGhost devnet.

## Features

- Block browsing and searching
- Transaction details
- Address lookup
- Network statistics
- Rich list
- Node status

## Setup Instructions

### Prerequisites

- Node.js >= 14.x
- npm >= 6.x
- MongoDB >= 4.x
- DarkGhost daemon running with RPC enabled

### Installation

```bash
# Clone the repository
git clone https://github.com/RasyaAndrean/DarkGhost-explorer.git
cd DarkGhost-explorer

# Install dependencies
npm install

# Configure the explorer
cp config.example.js config.js
# Edit config.js to match your setup

# Start the explorer
npm start
```

### Configuration

Edit `config.js` to match your setup:

```javascript
module.exports = {
  coin: 'DarkGhost',
  symbol: 'DG',
  port: 8080,
  daemon: {
    host: 'localhost',
    port: 18081,
  },
  mongodb: {
    host: 'localhost',
    port: 27017,
    db: 'darkghost_explorer',
  },
};
```

## Development

### Directory Structure

```
explorer/
├── config.js          # Configuration file
├── package.json       # Node.js dependencies
├── app/               # Main application
│   ├── routes/        # API routes
│   ├── views/         # HTML templates
│   ├── public/        # Static assets
│   └── lib/           # Helper functions
└── scripts/           # Utility scripts
```

## API Endpoints

- `/api/block/:height` - Get block by height
- `/api/transaction/:txid` - Get transaction by ID
- `/api/address/:address` - Get address details
- `/api/stats` - Network statistics

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a pull request

## License

MIT

## Contact

For questions about the explorer, contact:

- Rasya Andrean: rasyaandrean@outlook.co.id
