# DarkGhost Halving Schedule

## Emission Model and Reward Structure

## Overview

DarkGhost implements a fixed supply model with periodic halving events to control the emission rate of new coins. This document details the halving schedule and reward structure.

## Key Parameters

- **Total Supply**: 100,000,000 DG (100 million)
- **Initial Block Reward**: 50 DG
- **Halving Interval**: Every 262,800 blocks (approximately 4 years)
- **Block Time**: 120 seconds (2 minutes)
- **No Tail Emission**: Fixed supply with no perpetual emission

## Halving Schedule

| Halving | Block Height | Date (Est.) | Block Reward  | Coins Emitted | Cumulative Supply |
| ------- | ------------ | ----------- | ------------- | ------------- | ----------------- |
| Genesis | 0            | Sep 1, 2025 | 50 DG         | 50 DG         | 50 DG             |
| 1st     | 262,800      | Sep 1, 2029 | 25 DG         | 6,570,000 DG  | 6,570,050 DG      |
| 2nd     | 525,600      | Sep 1, 2033 | 12.5 DG       | 3,285,000 DG  | 9,855,050 DG      |
| 3rd     | 788,400      | Sep 1, 2037 | 6.25 DG       | 1,642,500 DG  | 11,497,550 DG     |
| 4th     | 1,051,200    | Sep 1, 2041 | 3.125 DG      | 821,250 DG    | 12,318,800 DG     |
| 5th     | 1,314,000    | Sep 1, 2045 | 1.5625 DG     | 410,625 DG    | 12,729,425 DG     |
| ...     | ...          | ...         | ...           | ...           | ...               |
| Final   | 5,256,000    | Sep 1, 2085 | 0.00000001 DG | ~0 DG         | 100,000,000 DG    |

## Emission Chart

```
Reward (DG)
|
50 | *
   |  *
25 |   *
   |    *
12 |     *
.5 |      *
   |       *
6. |        *
25 |         *
   |          *
3. |           *
125|            *
   |             *
1. |              *
562|
5  |               *
   |                *
0  +------------------+------> Time
   0                  60 years
```

## Mathematical Formula

The block reward at any given halving can be calculated using:

```
Reward = Initial_Reward / (2^n)
```

Where:

- Initial_Reward = 50 DG
- n = number of halvings that have occurred

The block height for any halving is:

```
Block_Height = Halving_Number * 262,800
```

## Economic Implications

### Inflation Schedule

- **Year 1-4**: 50 DG/block (high inflation)
- **Year 5-8**: 25 DG/block (reduced inflation)
- **Year 9-12**: 12.5 DG/block (further reduced)
- ...continuing until near-zero emission...

### Supply Growth

The total supply approaches the fixed limit of 100 million DG asymptotically, with each halving period contributing fewer new coins to the supply.

### Comparison to Other Cryptocurrencies

| Cryptocurrency | Total Supply | Halving Interval | Initial Reward |
| -------------- | ------------ | ---------------- | -------------- |
| DarkGhost (DG) | 100M         | 4 years          | 50 DG          |
| Bitcoin (BTC)  | 21M          | 4 years          | 50 BTC         |
| Monero (XMR)   | Unlimited\*  | 6 months         | Variable       |

\*Monero has tail emission after 2022

## Technical Implementation

The halving mechanism is implemented in the blockchain consensus rules:

1. **Block Reward Calculation**:

   - Check current block height
   - Determine number of completed halving periods
   - Apply halving formula to base reward

2. **Consensus Verification**:
   - Nodes verify block rewards match expected values
   - Reject blocks with incorrect rewards
   - Maintain supply counters

## Future Considerations

While the fixed supply provides predictability, the community may propose governance mechanisms to:

- Adjust the halving schedule
- Modify the emission curve
- Implement new economic features

Any changes would require community consensus through the RFC process.

## References

- [Genesis Parameters](core/genesis.h)
- [Blockchain Implementation](core/blockchain.cpp)
- [Economic Model Documentation](ECOSYSTEM.md)

---

_This document will be updated as the network progresses and actual dates are determined._
