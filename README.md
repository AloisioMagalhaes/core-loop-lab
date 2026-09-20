# Core Loop Lab

Vertical slice pequena em Godot para validar o loop de gameplay antes de adicionar multiplayer, economia e publicação.

## Executar

Abra o diretório no Godot 4 e execute o projeto. Controles: WASD ou setas. Pressione R para reiniciar.

## Testes

```powershell
python -m pytest tests
```

Se Godot 4 estiver disponível no PATH:

```powershell
godot --headless --path . --editor --quit
```

## Validação do planejamento

Leia `GDD.md`, `planning/decisions/ADR-0001-core-loop.md` e execute os testes estruturais antes de alterar o escopo.
