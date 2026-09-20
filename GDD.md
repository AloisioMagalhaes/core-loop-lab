# Core Loop Lab — GDD

## Objetivo

Validar uma vertical slice pequena em Godot para o loop: mover → localizar → coletar → receber feedback → progredir → repetir.

## Player experience

- Sessão-alvo: 45 segundos.
- Input: WASD ou setas.
- Objetivo: coletar o pulso antes do tempo acabar.
- Feedback: pontuação, nível, cor, texto e animação pulsante.
- Progressão: a cada 5 pulsos, o nível aumenta; cada coleta devolve 1,5 segundo.
- Falha/fim: o cronômetro termina; R reinicia a sessão.

## Critérios de aceitação

- O projeto abre em Godot 4 e inicia `main.tscn`.
- O jogador move-se dentro da arena.
- Coletar o pulso altera score, feedback e progressão.
- O cronômetro termina a sessão e R reinicia.
- A experiência pode ser explicada sem consultar o código.

## Fora de escopo

Multiplayer, persistência, economia, assets externos, matchmaking e publicação.

## Próxima evolução

Adicionar testes de contrato para estado da sessão, depois separar client/server com autoridade do servidor e mensagens versionadas.
