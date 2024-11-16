# Utiliser une image officielle Python comme image de base
FROM python:3.9

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier le contenu du répertoire actuel dans le conteneur
COPY . /app

# Installer les dépendances
RUN pip install -r requirements.txt

# Définir la variable d'environnement pour l'API de paiement (par exemple, une clé API de Stripe)
ENV PAYMENT_GATEWAY_API_KEY="your-payment-api-key"

# Exposer le port 5000
EXPOSE 5000

# Lancer l'application
CMD ["python", "payment-service.py"]

