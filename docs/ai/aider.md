# Aider

## Visão Geral (Aider + Ollama)

O Aider é um agente de desenvolvimento em CLI que utiliza uma LLM para editar código diretamente no projeto. 

Ele não substitui o Ollama, `o Aider é apenas um cliente`.

# Instalação

Atualize o pip:

```bash
python3 -m pip install --upgrade pip
```

Instale o Aider:

```bash
python3 -m pip install -U aider-chat
```

Verifique a instalação:

```bash
aider --version
```

# Configurando o Ollama

Configure a URL do servidor:

```bash
export OLLAMA_API_BASE=http://localhost:11434
```

Para tornar permanente:

```bash
echo 'export OLLAMA_API_BASE=http://localhost:11434' >> ~/.bashrc
source ~/.bashrc
```

# Listar modelos disponíveis

```bash
ollama list
```

# Executando

Entre na pasta do projeto:

```bash
cd ~/Projetos/Jarvis
```

Inicie:

```bash
aider
```

Ou inicie diretamente com um modelo específico:

```bash
aider --model ollama/hhao/qwen2.5-coder-tools:3b
```

```bash
aider --model ollama/qwen2.5-coder:7b
```

```bash
aider --model ollama/mychen76/qwen3_cline_roocode:4b
```

### Forçar respostas em PT-BR

Caso o modelo responda em inglês, envie a seguinte instrução no início da conversa:

```text
Responda sempre em português do Brasil, mantendo o código e identificadores em inglês quando apropriado.
```

# Configuração dos modelos

O Aider não controla:

- temperature
- top_p
- top_k
- context
- repeat_penalty

Esses parâmetros são configurados no Ollama através do Modelfile.

# Comandos úteis

## Adicionar arquivos ao contexto

```text
/add src/main.py
```

Adicionar uma pasta:

```text
/add src/
```

## Listar arquivos

```text
/files
```

## Remover arquivos do contexto

```text
/drop src/main.py
```

## Limpar contexto

```text
/clear
```

## Ajuda

```text
/help
```

## Perguntar sem editar arquivos

```text
/ask Explique este código.
```

## Executar comandos

```text
/run mvn test
```

ou

```text
/run pytest
```

## Criar commit

```text
/commit
```

## Desfazer última alteração

```text
/undo
```

# Boas práticas

- Utilize um modelo específico para cada finalidade.
- Configure temperatura e contexto apenas no Modelfile do Ollama.
- Mantenha o Git ativo para facilitar revisões e reversões.
- Adicione ao contexto apenas os arquivos necessários para reduzir consumo de tokens.
- Utilize `/ask` para dúvidas conceituais e solicitações que não exigem alteração no código.
- Utilize `/commit` após concluir uma tarefa para manter o histórico organizado.