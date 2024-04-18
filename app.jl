using Genie
using BSON

# Fonction pour charger le modèle
function load_model()
    model_path = "runs/model.bson"
    model = BSON.load(model_path)
    return model
end

# Charger le modèle
model = load_model()

# Définir la route /predict
route("/predict") do
    data = parse_request(JSON)  # Parse input data from request
    prediction = model.predict(data)  # Use your loaded model to make predictions
    return jsonify(prediction)  # Return predictions as JSON
end

# Démarrer l'application Genie.jl
up()
