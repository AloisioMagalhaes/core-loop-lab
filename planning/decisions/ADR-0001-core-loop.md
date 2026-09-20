# ADR-0001 — Core loop mínimo

## Classificação

- Área: compartilhada
- Impacto: baixo
- Status: aceita

## Decisão

Usar uma arena 2D sem assets externos para validar movimento, coleta, feedback, progressão e playtest em uma única cena Godot.

## Alternativas

- Começar com multiplayer: rejeitada por aumentar o risco antes de validar o loop local.
- Começar com assets e narrativa: rejeitada porque não testa o risco central.

## Evidências

- Skill consultada primeiro: `game-design-foundations`, `game-mechanics-and-systems`, `game-playtest`.
- Fonte original: `game-mechanics-advanced-design.pdf` e `practical-game-design-comprehensive-guide.pdf`.
- Seção/capítulo: mecânicas, prototipagem, progressão e playtesting.
- Tipo: síntese.
- Confiança: média.

## Validação

- Segurança: sem rede, persistência ou entrada externa.
- Performance: cena única, geometria desenhada por código.
- Acessibilidade: controles redundantes (WASD/setas), feedback textual e visual.
- Testes: verificação estrutural local; execução Godot pendente até haver um executável Godot 4 real disponível.

## Riscos remanescentes

- O comando `godot` do ambiente resolve para outro programa, não para Godot 4.
- A sensação de movimento e a legibilidade precisam de playtest humano.
