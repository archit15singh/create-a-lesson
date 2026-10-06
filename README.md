# Create a Lesson

Turn a topic into an interactive, browser-native lesson with a local Codex CLI.

```bash
./bin/learn "gradient descent"
```

The command creates `lessons/gradient-descent/index.html`, asks Codex to build the artifact under a clear learning and design contract, then opens it in your browser.

## Why this exists

This is a deliberately tiny AI-engineering teaching project: topic → Codex → generated software → browser feedback. It has no backend, build system, agent framework, or database.

## Start here

1. Install and authenticate the [Codex CLI](https://developers.openai.com/codex/cli/).
2. Clone this repository and run `./bin/learn "your topic"`.
3. Open [the included gradient-descent lesson](examples/gradient-descent/index.html) for the presentation-ready fallback.

## Visual language

Every lesson uses the same accessible, editorial design system: intentional hierarchy, CSS tokens, responsive cards, keyboard-accessible controls, and reduced-motion support. The generator chooses the smallest useful representation: Mermaid for flows, Chart.js for quantitative charts, SVG/Canvas for simulations, KaTeX for math, and specialist open-source libraries only when they earn their complexity.

## Upgrade path

Add research and citations, browser/screenshot verification, vision critique, a hidden-topic evaluation suite, learner models, and adaptive curricula—one evidence-backed improvement at a time.

## Verify

```bash
bash tests/learn.test.sh
```

## License

[MIT](LICENSE)
