# OpenHands + Ollama

## Visão Geral

O OpenHands é um agente de desenvolvimento autônomo inspirado no Devin.

Ele é capaz de:

- Analisar projetos
- Criar planos de implementação
- Editar arquivos
- Executar comandos no terminal
- Rodar testes
- Corrigir erros automaticamente
- Trabalhar com Git
- Interagir com LLMs através de APIs compatíveis com OpenAI

Arquitetura:

```
VS Code
    │
Projeto
    │
OpenHands
    │
OpenAI Compatible API
    │
Ollama
    │
LLMs
```

O OpenHands não executa modelos localmente.

Ele utiliza um servidor de LLM, como Ollama ou LM Studio.

---

# Pré-requisitos

- Docker
- Docker Compose (opcional)
- Ollama instalado
- Pelo menos um modelo configurado

Exemplo:

```
jarvis-code
jarvis-chat
jarvis-review
jarvis-architect
```

---

# Instalação

Crie uma pasta para o OpenHands:

```bash
mkdir ~/openhands
cd ~/openhands
```

Crie o arquivo:

```
docker-compose.yml
```

Conteúdo:

```yaml
services:
  openhands:
    image: docker.all-hands.dev/all-hands-ai/openhands:latest

    ports:
      - "3000:3000"

    volumes:
      - ~/.openhands:/app/.openhands
      - ~/Projetos:/workspace

    environment:
      - SANDBOX_RUNTIME_CONTAINER_IMAGE=docker.all-hands.dev/all-hands-ai/runtime:latest

    extra_hosts:
      - "host.docker.internal:host-gateway"
```

Inicie:

```bash
docker compose up -d
```

Acesse:

```
http://localhost:3000
```

---

# Configurando Ollama

No OpenHands:

Provider:

```
OpenAI Compatible
```

Base URL:

```
http://host.docker.internal:11434/v1
```

API Key:

```
qualquer_valor
```

(Modelos locais normalmente não validam a chave.)

Modelo:

```
jarvis-code
```

ou

```
jarvis-chat
```

---

# Modelos recomendados

## jarvis-code

Uso:

- Desenvolvimento
- Implementação
- Refatoração

Configuração sugerida:

```
temperature = 0.2
top_p = 0.9
num_ctx = 8192
```

---

## jarvis-review

Uso:

- Revisão de código
- Correção de bugs

```
temperature = 0.1
repeat_penalty = 1.1
```

---

## jarvis-architect

Uso:

- Planejamento
- Arquitetura

```
temperature = 0.4
num_ctx = 16384
```

---

## jarvis-chat

Uso:

- Conversação
- Documentação

```
temperature = 0.6
```

---

# Como funciona

Ao receber uma tarefa, o OpenHands executa um ciclo semelhante ao seguinte:

```
Usuário

↓

Planejamento

↓

Leitura do projeto

↓

Análise

↓

Implementação

↓

Execução de testes

↓

Correção de erros

↓

Nova execução

↓

Resposta
```

Esse comportamento torna o OpenHands mais completo, porém normalmente mais lento que agentes como Aider.

---

# Fluxo recomendado

```
Abrir VS Code

↓

Executar Ollama

↓

Executar OpenHands

↓

Abrir navegador

↓

localhost:3000

↓

Selecionar modelo

↓

Selecionar projeto

↓

Solicitar tarefa
```

---

# Exemplos de solicitações

Criar funcionalidade:

```
Implemente autenticação JWT utilizando Spring Security.
```

Refatorar:

```
Refatore UserService utilizando Strategy Pattern.
```

Corrigir erro:

```
Corrija todos os erros de compilação do projeto.
```

Criar testes:

```
Crie testes unitários utilizando JUnit 5.
```

Arquitetura:

```
Analise toda a arquitetura e sugira melhorias.
```

Documentação:

```
Crie um README completo para este módulo.
```

---

# Boas práticas

- Utilize um modelo dedicado para desenvolvimento.
- Utilize modelos pequenos (3B–7B) para maior velocidade em CPU.
- Mantenha o projeto sob controle de versão (Git).
- Solicite tarefas grandes em etapas menores.
- Revise alterações antes de aceitar mudanças.
- Execute os testes após cada implementação.

---

# Comparação com Aider

| Recurso | Aider | OpenHands |
|----------|--------|-----------|
| Interface | Terminal | Web |
| Planejamento | Básico | Avançado |
| Execução de comandos | Sim | Sim |
| Git | Sim | Sim |
| Testes automáticos | Limitado | Completo |
| Refatoração | Excelente | Excelente |
| Desenvolvimento diário | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐☆ |
| Grandes implementações | ⭐⭐⭐⭐☆ | ⭐⭐⭐⭐⭐ |
| Consumo de contexto | Baixo | Alto |
| Número de chamadas à LLM | Baixo | Alto |
| Velocidade em CPU | Alta | Média/Baixa |

---

# Organização recomendada

```
~/AI
│
├── ollama/
├── openhands/
├── aider/
├── open-webui/
├── models/
└── jarvis/
```

---

# Fluxo recomendado para o Jarvis

```
Ollama
│
├── jarvis-code
├── jarvis-chat
├── jarvis-review
└── jarvis-architect
        │
        ▼
OpenHands
        │
        ▼
Projeto Jarvis
        │
        ├── Planejamento
        ├── Implementação
        ├── Testes
        ├── Git
        └── Refatoração
```

---

# Quando utilizar o OpenHands

Utilize o OpenHands quando precisar:

- Implementar funcionalidades completas.
- Analisar projetos grandes.
- Corrigir múltiplos erros automaticamente.
- Refatorar diversos arquivos.
- Executar testes e corrigir falhas iterativamente.
- Trabalhar como um agente de desenvolvimento autônomo.

Para tarefas rápidas (correções pontuais, geração de código, pequenas refatorações), o **Aider** tende a oferecer uma experiência mais ágil e responsiva, especialmente em máquinas que executam os modelos predominantemente na CPU.