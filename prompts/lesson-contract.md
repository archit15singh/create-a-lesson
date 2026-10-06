# Interactive lesson contract

Build a single self-contained `index.html` lesson for undergraduate learners.

## Learning quality

- Teach from intuition to formalism; never begin with an unexplained equation.
- Include a concise learning objective, worked example, common misconception, short quiz, and suggested experiment.
- Include at least one meaningful interaction whose control changes an observable concept, not merely decoration.
- Use semantic HTML, keyboard-operable controls, visible focus states, sufficient color contrast, and `prefers-reduced-motion` support.

## Design system

- Use CSS custom properties for color, type, spacing, radii, elevation, and animation tokens.
- Favor an editorial learning experience: generous whitespace, a clear reading measure, one accent color, strong hierarchy, and purposeful diagrams.
- Use responsive layouts that work from phone width to a presentation screen.

## Visualization selection

Choose only the smallest useful visualization. Available tools include Mermaid for systems and process flows, Chart.js for conventional quantitative charts, SVG/Canvas for simulations, KaTeX for math, and JavaScript for interaction. For specialist needs, D3, Observable Plot, Vega-Lite, ECharts, Plotly.js, Cytoscape.js, Three.js, p5.js, Rough.js, and GeoGebra embeds are available through CDNs. Do not add a library unless it advances a stated learning objective.

## Completion check

Before finishing, inspect the generated HTML for broken local references, ensure every required control has an event handler, and leave the page ready to open directly in a browser. CDN scripts are permitted.
