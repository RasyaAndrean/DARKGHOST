// DarkGhost Devnet Explorer
const express = require('express');
const mongoose = require('mongoose');
const axios = require('axios');
const path = require('path');
const moment = require('moment');

const config = require('./config');

const app = express();
const port = config.port || 8080;

// Middleware
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'app/views'));
app.use(express.static(path.join(__dirname, 'app/public')));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// MongoDB connection
mongoose.connect(
  `mongodb://${config.mongodb.host}:${config.mongodb.port}/${config.mongodb.db}`,
  {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  }
);

// Simple in-memory storage for demo purposes
let blocks = [];
let transactions = [];
let addresses = [];

// Initialize with some sample data
function initializeData() {
  // Sample blocks
  for (let i = 0; i < 10; i++) {
    blocks.push({
      height: i,
      hash: `000000000000000000000000000000000000000000000000000000000000000${i}`,
      timestamp: Date.now() - i * 120000, // 2 minutes apart
      txCount: Math.floor(Math.random() * 5) + 1,
      size: Math.floor(Math.random() * 1000) + 500,
    });
  }

  // Sample transactions
  for (let i = 0; i < 20; i++) {
    transactions.push({
      txid: `dgtx${Math.random().toString(36).substring(2, 15)}${Math.random()
        .toString(36)
        .substring(2, 15)}`,
      blockHeight: Math.floor(Math.random() * 10),
      timestamp: Date.now() - Math.random() * 1200000,
      amount: (Math.random() * 1000).toFixed(4),
      fee: (Math.random() * 0.1).toFixed(6),
    });
  }

  // Sample addresses
  for (let i = 0; i < 10; i++) {
    addresses.push({
      address: `dg1${Math.random().toString(36).substring(2, 30)}`,
      balance: (Math.random() * 10000).toFixed(4),
      txCount: Math.floor(Math.random() * 50) + 1,
    });
  }
}

// Routes
app.get('/', (req, res) => {
  res.render('index', {
    coin: config.coin,
    symbol: config.symbol,
    blocks: blocks.slice(0, 10),
    transactions: transactions.slice(0, 10),
    network: config.network,
  });
});

app.get('/blocks', (req, res) => {
  res.render('blocks', {
    coin: config.coin,
    symbol: config.symbol,
    blocks: blocks,
    page: 1,
    totalPages: 1,
  });
});

app.get('/block/:height', (req, res) => {
  const height = parseInt(req.params.height);
  const block = blocks.find(b => b.height === height);

  if (!block) {
    return res.status(404).render('error', {
      message: 'Block not found',
    });
  }

  // Find transactions for this block
  const blockTransactions = transactions.filter(
    tx => tx.blockHeight === height
  );

  res.render('block', {
    coin: config.coin,
    symbol: config.symbol,
    block: block,
    transactions: blockTransactions,
  });
});

app.get('/tx/:txid', (req, res) => {
  const txid = req.params.txid;
  const transaction = transactions.find(tx => tx.txid === txid);

  if (!transaction) {
    return res.status(404).render('error', {
      message: 'Transaction not found',
    });
  }

  res.render('transaction', {
    coin: config.coin,
    symbol: config.symbol,
    transaction: transaction,
  });
});

app.get('/address/:address', (req, res) => {
  const address = req.params.address;
  const addr = addresses.find(a => a.address === address);

  if (!addr) {
    return res.status(404).render('error', {
      message: 'Address not found',
    });
  }

  // Find transactions for this address
  const addrTransactions = transactions.slice(0, 5);

  res.render('address', {
    coin: config.coin,
    symbol: config.symbol,
    address: addr,
    transactions: addrTransactions,
  });
});

app.get('/api/stats', (req, res) => {
  res.json({
    blockHeight: blocks.length > 0 ? blocks[blocks.length - 1].height : 0,
    txCount: transactions.length,
    addressCount: addresses.length,
    network: config.network,
  });
});

// Start server
app.listen(port, () => {
  console.log(`${config.coin} Explorer listening at http://localhost:${port}`);
  initializeData();
});

module.exports = app;
