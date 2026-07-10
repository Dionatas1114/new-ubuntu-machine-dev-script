# Pré-requisitos

- Python 3.10+
- Git
- Ollama (ou outro servidor OpenAI Compatible)
- Modelo instalado

---

# Instalação

Criar ambiente virtual:

```bash
python3 -m venv .venv
```

Ativar:

```bash
source .venv/bin/activate
```

Atualizar pip:

```bash
pip install --upgrade pip
```

Instalar MiMo Code:

```bash
pip install mimo-code
```

Verificar instalação:

```bash
mimo --version
```

---

# Configurando Ollama

Definir a URL da API:

```bash
export OPENAI_BASE_URL=http://localhost:11434/v1
```

Definir uma chave (qualquer valor):

```bash
export OPENAI_API_KEY=ollama
```

Definir modelo padrão:

```bash
export OPENAI_MODEL=jarvis-code
```

Persistir configuração:

```bash
echo 'export OPENAI_BASE_URL=http://localhost:11434/v1' >> ~/.bashrc

echo 'export OPENAI_API_KEY=ollama' >> ~/.bashrc

echo 'export OPENAI_MODEL=jarvis-code' >> ~/.bashrc

source ~/.bashrc
```

---

# Executando

Entrar no projeto:

```bash
cd ~/Projetos/Jarvis
```

Iniciar:

```bash
mimo
```

---

# Modelos recomendados

## jarvis-code

Uso:

- Implementação
- Desenvolvimento
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
- Pull Requests
- Melhorias

Configuração:

```
temperature = 0.1

repeat_penalty = 1.1
```

---

## jarvis-architect

Uso:

- Planejamento
- Arquitetura
- Grandes implementações

Configuração:

```
temperature = 0.4

num_ctx = 16384
```

---

## jarvis-chat

Uso:

- Conversação
- Documentação

Configuração:

```
temperature = 0.6
```

---

# Fluxo de trabalho

```
Usuário

↓

Planejamento

↓

Leitura do projeto

↓

Implementação

↓

Execução

↓

Correção

↓

Git

↓

Resposta
```

---

# Exemplos

Criar API:

```
Implemente uma API REST utilizando Spring Boot.
```

Criar CRUD:

```
Implemente CRUD completo para usuários.
```

Refatorar:

```
Refatore UserService utilizando Strategy Pattern.
```

Criar testes:

```
Implemente testes unitários para AuthService.
```

Documentação:

```
Documente todo o módulo utilizando Markdown.
```

Arquitetura:

```
Analise este projeto e proponha melhorias arquiteturais.
```

---

# Goal Driven

Uma das principais funcionalidades do MiMo Code é trabalhar por objetivos.

Exemplo:

```
Faça todos os testes passarem.
```

ou

```
Implemente autenticação JWT e deixe o projeto compilando.
```

O agente continuará iterando até atingir o objetivo.

---

# Memória

O MiMo Code mantém informações da sessão e pode utilizar checkpoints para continuar tarefas interrompidas.

Vantagens:

- Continuidade entre sessões
- Menor repetição de contexto
- Melhor desempenho em projetos grandes

---

# Git

Exemplos de tarefas:

```
Analise este Pull Request.
```

```
Crie um commit para esta implementação.
```

```
Refatore este módulo preservando compatibilidade.
```

---

# Boas práticas

- Utilize modelos pequenos (3B–7B) para maior velocidade em CPU.
- Utilize modelos maiores apenas para planejamento complexo.
- Trabalhe em tarefas pequenas e incrementais.
- Revise alterações antes dos commits.
- Execute testes ao final de cada implementação.
- Utilize Git para versionar todas as mudanças.

---

# Comparação

| Recurso | Aider | MiMo Code | OpenHands |
|----------|--------|-----------|-----------|
| Interface | Terminal | Terminal | Web |
| Velocidade | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐☆ | ⭐⭐☆☆☆ |
| Planejamento | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Memória Persistente | ❌ | ✅ | Parcial |
| Objetivos (Goal Driven) | ❌ | ✅ | ✅ |
| Git | ✅ | ✅ | ✅ |
| Refatoração | ⭐⭐⭐⭐☆ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Desenvolvimento Diário | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐☆ | ⭐⭐⭐⭐☆ |
| Grandes Implementações | ⭐⭐⭐⭐☆ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| Consumo de Contexto | Baixo | Médio | Alto |