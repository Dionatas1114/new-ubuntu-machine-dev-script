# Setup Dev Machine (Ubuntu / Linux Mint)

Automação para configurar máquina de desenvolvimento em 1 comando.

---

## 🚀 Uso

### Full setup (DEV + IA)
```bash
bash setup.sh --full
```
### Minimal setup (DEV)
```bash
bash setup.sh --minimal
```

📦 O que instala
---
DEV

```
build-essential
git
curl / wget
python3 + pip + venv
Docker
VS Code
DBeaver
```

IA (full)
```
...
```

🧠 Compatibilidade
---

```
Ubuntu 22.04+
Linux Mint 21+
```

⚠️ Importante
---

Após instalação do Docker, reinicie a sessão para aplicar permissões:

```
newgrp docker
```