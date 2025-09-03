# DarkGhost Devnet Explorer

## Overview

The DarkGhost Devnet Explorer is a web-based interface for browsing and analyzing the DarkGhost blockchain. It provides real-time information about blocks, transactions, and network statistics.

## Features

- Block browsing and searching
- Transaction details
- Address lookup
- Network statistics
- Responsive design for desktop and mobile

## Technology Stack

- **Frontend**: HTML, CSS, JavaScript, Bootstrap 5
- **Backend**: Node.js, Express.js
- **Database**: MongoDB (for caching and indexing)
- **Template Engine**: EJS

## Architecture

```
explorer/
├── app.js              # Main application entry point
├── config.js           # Configuration file
├── package.json        # Node.js dependencies
├── README.md           # Explorer documentation
├── app/                # Application source
│   ├── routes/         # API routes
│   ├── views/          # HTML templates (EJS)
│   ├── public/         # Static assets (CSS, JS, images)
│   └── lib/            # Helper functions
└── test/               # Test files
```

## API Endpoints

- `GET /` - Home page with latest blocks and transactions
- `GET /blocks` - List of all blocks
- `GET /block/:height` - Details for a specific block
- `GET /tx/:txid` - Details for a specific transaction
- `GET /address/:address` - Details for a specific address
- `GET /api/stats` - Network statistics in JSON format

## Installation

```bash
# Navigate to the explorer directory
cd explorer

# Install dependencies
npm install

# Copy and edit configuration
cp config.example.js config.js
# Edit config.js to match your setup

# Start the explorer
npm start
```

## Configuration

The explorer can be configured through `config.js`:

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

To run the explorer in development mode with auto-reload:

```bash
npm run dev
```

## Testing

To run tests:

```bash
npm test
```

## Deployment

The explorer can be deployed using:

- Docker containers
- Cloud platforms (AWS, Google Cloud, Azure)
- Traditional web servers (Nginx, Apache)

## Integration with DarkGhost Daemon

The explorer connects to the DarkGhost daemon through RPC:

1. Ensure the daemon is running with RPC enabled
2. Configure the daemon RPC settings in `config.js`
3. The explorer will automatically sync with the blockchain

## Future Enhancements

Planned features:

- Real-time WebSocket updates
- Advanced search functionality
- Charts and graphs for network statistics
- Mobile app integration
- Multi-language support

## Troubleshooting

Common issues:

1. **Connection refused**: Check if the DarkGhost daemon is running
2. **Database connection failed**: Verify MongoDB is running and accessible
3. **Missing dependencies**: Run `npm install` to install all dependencies

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
