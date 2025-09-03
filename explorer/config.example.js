// DarkGhost Explorer Configuration
module.exports = {
  // General settings
  coin: 'DarkGhost',
  symbol: 'DG',
  port: 8080,

  // Daemon RPC settings
  daemon: {
    host: 'localhost',
    port: 18081,
    user: '',
    password: '',
  },

  // MongoDB settings
  mongodb: {
    host: 'localhost',
    port: 27017,
    db: 'darkghost_explorer',
    user: '',
    password: '',
  },

  // Network settings
  network: {
    name: 'devnet',
    genesisBlockHash:
      '0000000000000000000000000000000000000000000000000000000000000000',
    blockTime: 120, // seconds
    confirmations: 10,
  },

  // Explorer settings
  explorer: {
    blocksPerPage: 20,
    txsPerPage: 50,
    addressesPerPage: 50,
    maxBlockTransactions: 1000,
  },

  // API settings
  api: {
    rateLimit: {
      windowMs: 15 * 60 * 1000, // 15 minutes
      max: 100, // limit each IP to 100 requests per windowMs
    },
  },

  // Development settings
  development: {
    debug: false,
    logLevel: 'info',
  },
};
