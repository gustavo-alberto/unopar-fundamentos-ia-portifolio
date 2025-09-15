# Usa imagem oficial do Python 3.13
FROM python:3.13-slim

# Defini diretório de trabalho
WORKDIR /app

# Copia requirements primeiro
COPY requirements.txt .

# Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o restante do projeto
COPY . .

# Comando padrão ao rodar o container
CMD ["python", "main.py"]
