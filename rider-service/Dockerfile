# Utiliser une image de base avec Python installé
FROM python:3.9-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier des dépendances
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le reste du code de l'application
COPY . .

# Exposer le port que le service utilise
EXPOSE 5001

# Commande pour lancer l'application
CMD ["python", "rider-service.py"]
