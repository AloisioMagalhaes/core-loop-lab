# Core Loop Lab

Vertical slice pequena em Godot para validar o loop de gameplay antes de adicionar multiplayer, economia e publicação.

## Executar

Abra o diretório no Godot 4 e execute o projeto. Controles: WASD ou setas. Pressione R para reiniciar.

## Executável Godot configurado

O projeto usa a variável de ambiente `GODOT_ENGINE` para localizar o executável Godot. A validação local confirmou:

```text
GODOT_ENGINE=C:\Users\educa\Desktop\escola\GAMES\Godot\engine\Godot_v4.7.2-stable_win64_console.exe
Godot 4.7.2.stable.official
```

Validação:

```powershell
$godot = [Environment]::GetEnvironmentVariable('GODOT_ENGINE', 'Machine')
& $godot --headless --path . --editor --quit
& $godot --headless --path . --quit-after 2
```

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
