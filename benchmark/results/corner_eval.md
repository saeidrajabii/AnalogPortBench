# LLM designs that pass at TT: robustness across process corners

| Model | Effort | Mode | Pass at TT | Pass at all 5 corners | Share |
|---|---|---|---|---|---|
| claude-haiku55 | low | zero-shot | 10 | 8 | 80% |
| claude-haiku55 | medium | feedback | 6 | 3 | 50% |
| claude-haiku55 | medium | zero-shot | 9 | 9 | 100% |
| claude-opus | low | zero-shot | 22 | 17 | 77% |
| claude-opus | medium | feedback | 17 | 7 | 41% |
| claude-opus | medium | zero-shot | 33 | 25 | 76% |
| claude-sonnet | low | zero-shot | 15 | 10 | 67% |
| claude-sonnet | medium | feedback | 7 | 3 | 43% |
| claude-sonnet | medium | zero-shot | 15 | 10 | 67% |
| gpt-6-luna | low | zero-shot | 12 | 10 | 83% |
| gpt-6-luna | medium | feedback | 1 | 0 | 0% |
| gpt-6-luna | medium | zero-shot | 13 | 12 | 92% |
| gpt-6-sol | low | zero-shot | 16 | 13 | 81% |
| gpt-6-sol | medium | feedback | 9 | 1 | 11% |
| gpt-6-sol | medium | zero-shot | 20 | 17 | 85% |
| gpt-6.1-sol | low | zero-shot | 18 | 12 | 67% |
| gpt-6.1-sol | medium | feedback | 20 | 6 | 30% |
| gpt-6.1-sol | medium | zero-shot | 28 | 17 | 61% |

Designs failing at each corner: SF 38, FS 70, FF 36, SS 41
