# RFC-001: Ring Size Selection for DarkGhost

## Overview

This RFC proposes a vote to determine the default ring size for DarkGhost transactions. The ring size is a critical parameter that affects both privacy and performance of the network.

## Background

Ring signatures are a core privacy feature in DarkGhost that obscure the true sender of a transaction by mixing their signature with others. The ring size determines how many decoys are included in each signature:

- Larger ring sizes provide better privacy but increase transaction size and verification time
- Smaller ring sizes improve performance but offer less privacy

## Proposal

We are proposing a vote between two ring size options:

1. **Ring Size 11** (5 decoys + 1 real)

   - Moderate privacy level
   - Good performance balance
   - Similar to Monero's current implementation

2. **Ring Size 17** (11 decoys + 1 real)
   - Stronger privacy level
   - Higher transaction sizes
   - Longer verification times

## Voting Process

This vote will be conducted through:

1. GitHub issue reactions (this issue: #7)
2. Snapshot DAO vote on the devnet
3. Community Discord poll

### Voting Options

- React with 🚀 for Ring Size 11
- React with 🎉 for Ring Size 17

### Voting Timeline

- Start: September 10, 2025, 00:00 UTC
- End: September 12, 2025, 00:00 UTC
- Results announced: September 13, 2025

## Technical Considerations

### Privacy Analysis

- **Ring Size 11**: Provides good privacy against statistical analysis
- **Ring Size 17**: Offers stronger resistance to advanced deanonymization techniques

### Performance Impact

| Metric            | Ring Size 11 | Ring Size 17 | Difference |
| ----------------- | ------------ | ------------ | ---------- |
| Transaction Size  | ~20 KB       | ~30 KB       | +50%       |
| Verification Time | ~100 ms      | ~150 ms      | +50%       |
| Memory Usage      | ~50 MB       | ~75 MB       | +50%       |

### Network Effects

- Larger ring sizes require more network bandwidth
- May affect mobile wallet performance
- Storage requirements increase proportionally

## Implementation Timeline

If Ring Size 11 is selected:

- Implementation in v0.3.0-alpha (Sprint 0.3)
- Testing in devnet: September 20-30, 2025
- Final verification: October 1-15, 2025

If Ring Size 17 is selected:

- Implementation in v0.3.0-alpha (Sprint 0.3)
- Testing in devnet: September 25 - October 5, 2025
- Final verification: October 6-20, 2025

## Discussion

Please discuss this proposal in:

- GitHub issue comments
- Discord #governance channel
- Community forums

## Vote Result Tracking

The vote results will be tracked at:

- GitHub: Issue #7 reactions
- Snapshot: https://snapshot.darkghost.network (after launch)
- Discord: Poll in #governance channel

## Contact

For questions about this RFC, contact:

- Rasya Andrean (Lead Developer): rasyaandrean@outlook.co.id
- Community Team: community@darkghost.network

---

_This is the first RFC in the DarkGhost governance process. Future RFCs will follow the same template and voting procedure._
