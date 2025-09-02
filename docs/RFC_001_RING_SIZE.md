# RFC-001: Ring Size Default for DarkGhost

## Summary

This RFC proposes the default ring size for DarkGhost transactions. We are considering two options:
- Option A: Ring size 11 (10 decoys + 1 real) - same as current implementation
- Option B: Ring size 17 (16 decoys + 1 real) - higher privacy

## Status

**Proposed** - Open for community discussion

## Background

Ring signatures are a core privacy feature in DarkGhost, providing unlinkability between transactions. The ring size determines how many decoy outputs are mixed with the real output, making it harder to determine which is the actual spent output.

## Options

### Option A: Ring Size 11 (Default)
- **Pros**:
  - Lower transaction fees
  - Faster transaction creation
  - Smaller blockchain size
  - Same as current Monero implementation
- **Cons**:
  - Lower privacy level compared to larger rings

### Option B: Ring Size 17 (Enhanced)
- **Pros**:
  - Higher privacy level
  - Better resistance to blockchain analysis
  - Future-proofing against advances in analysis techniques
- **Cons**:
  - Higher transaction fees (55% larger)
  - Slower transaction creation
  - Larger blockchain size

## Technical Analysis

### Transaction Size Impact
- Ring size 11: ~2KB average transaction size
- Ring size 17: ~3.1KB average transaction size

### Performance Impact
- Ring size 11: ~100ms transaction creation time
- Ring size 17: ~150ms transaction creation time

### Fee Impact
- Ring size 11: ~0.0001 DG average fee
- Ring size 17: ~0.000155 DG average fee

## Security Considerations

### Anonymity Set
- Ring size 11: Anonymity set of 11 outputs
- Ring size 17: Anonymity set of 17 outputs

### Blockchain Analysis Resistance
Larger ring sizes provide better resistance against:
- Heuristic-based analysis
- Input-output linking
- Timing analysis

## Community Impact

### User Experience
- Larger ring sizes may impact users with slower devices
- Higher fees may impact users with small transactions

### Network Effects
- Larger ring sizes improve privacy for all network participants
- May attract privacy-focused users

## Recommendation

We recommend **Option A (Ring size 11)** for the initial launch with the possibility to increase to ring size 17 in a future hard fork after evaluating network performance and user feedback.

This approach provides a good balance between:
- Immediate privacy (ring size 11 is still very strong)
- Network adoption (lower fees and faster transactions)
- Future flexibility (can increase in hard fork)

## Implementation Timeline

If Option A is chosen:
- Implement in v0.1.0-alpha
- Monitor network performance
- Re-evaluate before mainnet launch

If Option B is chosen:
- Implement in v0.1.0-alpha
- Optimize performance for larger ring sizes
- Educate users about fee implications

## Discussion

Please provide feedback on:
1. Which option you prefer and why
2. Any technical considerations we may have missed
3. Impact on your intended use cases
4. Alternative approaches

## References

- [Monero Ring Signatures](https://web.getmonero.org/resources/moneropedia/ringsignatures.html)
- [RingCT Paper](https://eprint.iacr.org/2015/1098.pdf)
- [DarkGhost Technical Documentation](ARCHITECTURE.md)

## Copyright

This document is licensed under the GPL-3.0 License.